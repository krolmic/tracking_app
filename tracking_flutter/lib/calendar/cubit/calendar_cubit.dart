import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/shared/date_time.dart';
import 'package:user_profile_repository/user_profile_repository.dart'
    as user_profile_repository;

part 'calendar_cubit.freezed.dart';
part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit({
    required MoodRepository moodRepository,
    required user_profile_repository.UserProfileRepository
        userProfileRepository,
  })  : _moodRepository = moodRepository,
        _userProfileRepository = userProfileRepository,
        super(const CalendarState());

  final MoodRepository _moodRepository;

  final user_profile_repository.UserProfileRepository _userProfileRepository;

  Future<void> init() async {
    await loadMoodsInMonth();
  }

  Future<void> loadMoodsInMonth() async {
    try {
      emit(state.copyWith(moodsState: const CalendarMoodsState.loading()));

      final userId = await _userProfileRepository.getCurrentUserId();
      final moods = await _moodRepository.getMoodsInTimeRange(
        userId: userId,
        from: state.targetDate.date.startOfMonth,
        to: state.targetDate.date.endOfMonth,
      );

      emit(
        state.copyWith(
          moodsState: CalendarMoodsState.loaded(
            moods: moods,
          ),
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e('Failed to load moods', ex: e, stacktrace: stackTrace);
      emit(state.copyWith(moodsState: const CalendarMoodsState.error()));
    }
  }

  void setTargetDate(DateTime date) {
    emit(
      state.copyWith(
        targetDate: CalendarTargetDateState.set(date: date),
      ),
    );
  }
}
