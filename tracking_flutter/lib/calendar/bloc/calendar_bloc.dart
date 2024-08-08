import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/shared/extensions/date_time.dart';
import 'package:user_profile_repository/user_profile_repository.dart'
    as user_profile_repository;

part 'calendar_bloc.freezed.dart';
part 'calendar_events.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc({
    required MoodRepository moodRepository,
    required user_profile_repository.UserProfileRepository
        userProfileRepository,
  })  : _moodRepository = moodRepository,
        _userProfileRepository = userProfileRepository,
        super(const CalendarState()) {
    on<CalendarEvent>((event, emit) async {
      await event.when(
        calendarInitialized: () => _onMonthyMoodsInitialized(emit),
        targetDateChanged: (date) => _onTargetDateChanged(date, emit),
        moodsUpdated: () => _onMoodsUpdated(emit),
      );
    });
  }

  final MoodRepository _moodRepository;

  final user_profile_repository.UserProfileRepository _userProfileRepository;

  Future<void> _onMonthyMoodsInitialized(Emitter<CalendarState> emit) async {
    await _loadMoodsInMonth(emit);
  }

  Future<void> _onTargetDateChanged(
    DateTime date,
    Emitter<CalendarState> emit,
  ) async {
    await _loadMoodsInMonth(emit, newTargetDate: date);
  }

  Future<void> _onMoodsUpdated(Emitter<CalendarState> emit) async {
    await _loadMoodsInMonth(emit);
  }

  Future<void> _loadMoodsInMonth(
    Emitter<CalendarState> emit, {
    DateTime? newTargetDate,
  }) async {
    try {
      emit(
        state.copyWith(
          moodsState: const CalendarMoodsState.loading(),
          targetDate: newTargetDate != null
              ? CalendarTargetDateState.set(date: newTargetDate)
              : state.targetDate,
        ),
      );

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
}
