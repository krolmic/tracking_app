import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/shared/date_time.dart';
import 'package:user_profile_repository/user_profile_repository.dart'
    as user_profile_repository;

part 'graph_bloc.freezed.dart';
part 'graph_event.dart';
part 'graph_state.dart';

class GraphBloc extends Bloc<GraphEvent, GraphState> {
  GraphBloc({
    required MoodRepository moodRepository,
    required user_profile_repository.UserProfileRepository
        userProfileRepository,
  })  : _moodRepository = moodRepository,
        _userProfileRepository = userProfileRepository,
        super(const GraphState()) {
    on<GraphEvent>((event, emit) async {
      if (event.isGraphInitialized) {
        await _onGraphInitialized(emit);
      } else if (event.isTargetDateChanged) {
        await _onTargetDateChanged(event.date, emit);
      } else if (event.isMoodsUpdated) {
        await _onMoodsUpdated(emit);
      } else if (event.isShowWorkTimeTriggered) {
        _onShowWorkTimeTriggered(emit);
      } else if (event.isShowRevenueTriggered) {
        _onShowRevenueTriggered(emit);
      }
    });
  }

  final MoodRepository _moodRepository;

  final user_profile_repository.UserProfileRepository _userProfileRepository;

  Future<void> _onGraphInitialized(Emitter<GraphState> emit) async {
    await _loadMoods(emit, newTargetDate: DateTime.now());
  }

  Future<void> _onTargetDateChanged(
    DateTime date,
    Emitter<GraphState> emit,
  ) async {
    await _loadMoods(emit, newTargetDate: date);
  }

  Future<void> _onMoodsUpdated(Emitter<GraphState> emit) async {
    await _loadMoods(emit);
  }

  void _onShowRevenueTriggered(Emitter<GraphState> emit) {
    emit(
      state.copyWith(
        settings: state.settings.copyWith(
          showRevenue: !state.settings.showRevenue,
        ),
      ),
    );
  }

  void _onShowWorkTimeTriggered(Emitter<GraphState> emit) {
    emit(
      state.copyWith(
        settings: state.settings.copyWith(
          showWorkTime: !state.settings.showWorkTime,
        ),
      ),
    );
  }

  Future<void> _loadMoods(
    Emitter<GraphState> emit, {
    DateTime? newTargetDate,
  }) async {
    try {
      emit(
        state.copyWith(
          moodsState: const GraphMoodsState.loading(),
          targetDate: newTargetDate != null
              ? GraphTargetDateState.set(date: newTargetDate)
              : state.targetDate,
        ),
      );

      final userId = await _userProfileRepository.getCurrentUserId();
      final moods = await _moodRepository.getMoodsInTimeRange(
        userId: userId,
        from: state.timeRangeMode.when(
          monthly: () => state.targetDate.date.startOfMonth,
          weekly: () => state.targetDate.date.startOfWeek,
        ),
        to: state.timeRangeMode.when(
          monthly: () => state.targetDate.date.endOfMonth,
          weekly: () => state.targetDate.date.endOfWeek,
        ),
      );

      emit(
        state.copyWith(
          moodsState: GraphMoodsState.loaded(
            moods: moods,
          ),
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e('Failed to load moods', ex: e, stacktrace: stackTrace);
      emit(state.copyWith(moodsState: const GraphMoodsState.error()));
    }
  }
}
