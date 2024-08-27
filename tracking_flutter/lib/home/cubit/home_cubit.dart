import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/shared/extensions/date_time.dart';
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
    await _loadMoods();
  }

  Future<void> _loadMoods() async {
    try {
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
          ),
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e('Failed to load moods in home', ex: e, stacktrace: stackTrace);
      emit(state.copyWith(moodsListState: const MoodsListState.error()));
    }
  }
}
