import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:user_profile_repository/user_profile_repository.dart'
    as user_profile_repository;

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required MoodRepository moodRepository,
    required DataStoreCategory dataStore,
    required user_profile_repository.UserProfileRepository
        userProfileRepository,
  })  : _moodRepository = moodRepository,
        _userProfileRepository = userProfileRepository,
        _dataStore = dataStore,
        super(const HomeState());

  final MoodRepository _moodRepository;

  final user_profile_repository.UserProfileRepository _userProfileRepository;

  final DataStoreCategory _dataStore;

  late final StreamSubscription<SubscriptionEvent<MoodEntry>>? _moodEntryStream;

  Future<void> init() async {
    await loadMoods();
    listenMoodEntryChanges();
  }

  void listenMoodEntryChanges() {
    _moodEntryStream = _dataStore.observe(MoodEntry.classType).listen(
      (event) {
        safePrint('Received event of type ${event.eventType}');
        safePrint('Received mood entry ${event.item}');

        if (event.eventType == EventType.create) {
          safePrint('Reloading moods...');

          loadMoods(reloadMoods: true);
        } else if (event.eventType == EventType.update &&
            state.moodsState.isSuccess) {
          final moodsState = state.moodsState as HomeMoodsSuccessState;

          final updatedMoodIndex = moodsState.moods.indexWhere(
            (mood) => mood.id == event.item.id,
          );

          if (updatedMoodIndex != -1) {
            final updatedMoods = [
              ...moodsState.moods,
            ];

            updatedMoods[updatedMoodIndex] = Mood.fromMoodEntry(event.item);

            emit(
              state.copyWith(
                moodsState: moodsState.copyWith(
                  moods: updatedMoods,
                ),
              ),
            );
          }
        }
      },
    );
  }

  Future<void> stopListeningMoodEntryChanges() async {
    await _moodEntryStream?.cancel();
  }

  @override
  Future<void> close() async {
    await stopListeningMoodEntryChanges();
    return super.close();
  }

  Future<void> loadMoods({bool? reloadMoods}) async {
    try {
      if (state.moodsState.isInitial || (reloadMoods != null && reloadMoods)) {
        emit(
          state.copyWith(
            moodsState: const HomeMoodsState.loading(),
          ),
        );

        final userId = await _userProfileRepository.getCurrentUserId();
        final moods = await _moodRepository.getMoods(
          page: 0,
          userId: userId,
        );

        safePrint('initial moods length ${moods.length}');

        emit(
          state.copyWith(
            moodsState: HomeMoodsState.loaded(
              moods: moods,
              hasReachedMax: moods.length < 15,
              loadingMore: false,
              nextPageToLoad: 1,
            ),
          ),
        );

        return;
      }

      await state.moodsState.whenOrNull(
        loaded: (moods, loadingMore, hasReachedMax, nextPageToLoad) async {
          if (hasReachedMax) {
            safePrint('Has reached max');
            return;
          } else {
            if (loadingMore) {
              return;
            }

            emit(
              state.copyWith(
                moodsState: HomeMoodsState.loaded(
                  moods: moods,
                  loadingMore: true,
                  hasReachedMax: hasReachedMax,
                  nextPageToLoad: nextPageToLoad,
                ),
              ),
            );

            final userId = await _userProfileRepository.getCurrentUserId();
            final fetchedMoods = await _moodRepository.getMoods(
              page: nextPageToLoad,
              userId: userId,
            );

            safePrint(
              'additionally fetched moods length ${fetchedMoods.length}',
            );

            emit(
              state.copyWith(
                moodsState: HomeMoodsState.loaded(
                  moods: moods + fetchedMoods,
                  hasReachedMax: fetchedMoods.length < 15,
                  loadingMore: false,
                  nextPageToLoad: nextPageToLoad + 1,
                ),
              ),
            );
          }
        },
      );
    } catch (e, stackTrace) {
      emit(state.copyWith(moodsState: const HomeMoodsState.error()));
    }
  }
}
