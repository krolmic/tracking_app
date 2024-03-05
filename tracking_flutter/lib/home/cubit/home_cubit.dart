import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:user_profile_repository/user_profile_repository.dart'
    as user_profile_repository;

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required MoodRepository moodRepository,
    required user_profile_repository.UserProfileRepository
        userProfileRepository,
  })  : _moodRepository = moodRepository,
        _userProfileRepository = userProfileRepository,
        super(const HomeState());

  final MoodRepository _moodRepository;

  final user_profile_repository.UserProfileRepository _userProfileRepository;

  Future<void> init() async {
    await loadMoods();
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

        emit(
          state.copyWith(
            moodsState: HomeMoodsState.loaded(
              moods: moods,
              hasReachedMax: moods.length < MoodRepository.paginationLimit,
              loadingMore: false,
              nextPageToLoad: 1,
            ),
          ),
        );

        return;
      }

      await state.moodsState.whenOrNull(
        loaded: (moods, loadingMore, hasReachedMax, nextPageToLoad) async {
          if (hasReachedMax || loadingMore) {
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

          emit(
            state.copyWith(
              moodsState: HomeMoodsState.loaded(
                moods: moods + fetchedMoods,
                hasReachedMax:
                    fetchedMoods.length < MoodRepository.paginationLimit,
                loadingMore: false,
                nextPageToLoad: nextPageToLoad + 1,
              ),
            ),
          );
        },
      );
    } catch (e, stackTrace) {
      Fimber.e('Failed to load moods', ex: e, stacktrace: stackTrace);
      emit(state.copyWith(moodsState: const HomeMoodsState.error()));
    }
  }
}
