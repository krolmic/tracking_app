import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/shared/extensions/date_time.dart';
import 'package:user_profile_repository/user_profile_repository.dart'
    as user_profile_repository;

part 'moods_cubit.freezed.dart';
part 'moods_state.dart';

class MoodsCubit extends Cubit<MoodsState> {
  MoodsCubit({
    required MoodRepository moodRepository,
    required user_profile_repository.UserProfileRepository
        userProfileRepository,
  })  : _moodRepository = moodRepository,
        _userProfileRepository = userProfileRepository,
        super(const MoodsState());

  final MoodRepository _moodRepository;

  final user_profile_repository.UserProfileRepository _userProfileRepository;

  Future<void> init() async {
    await loadMoods();
  }

  Future<void> loadMoods({bool? reloadMoods}) async {
    try {
      if (state.moodsListState.isInitial ||
          (reloadMoods != null && reloadMoods)) {
        emit(
          state.copyWith(
            moodsListState: const MoodsListState.loading(),
          ),
        );

        final userId = await _userProfileRepository.getCurrentUserId();
        final moods = await _moodRepository.getMoods(
          page: 0,
          userId: userId,
        );

        emit(
          state.copyWith(
            moodsListState: MoodsListState.loaded(
              moods: moods,
              hasReachedMax: moods.length < MoodRepository.paginationLimit,
              loadingMore: false,
              nextPageToLoad: 1,
            ),
          ),
        );

        return;
      }

      await state.moodsListState.whenOrNull(
        loaded: (moods, loadingMore, hasReachedMax, nextPageToLoad) async {
          if (hasReachedMax || loadingMore) {
            return;
          }

          emit(
            state.copyWith(
              moodsListState: MoodsListState.loaded(
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
              moodsListState: MoodsListState.loaded(
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
      emit(state.copyWith(moodsListState: const MoodsListState.error()));
    }
  }
}
