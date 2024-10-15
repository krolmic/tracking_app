import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graph_settings_repository/graph_settings_repository.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/shared/extensions/date_time.dart';
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
    required GraphSettingsRepository graphSettingsRepository,
  })  : _moodRepository = moodRepository,
        _userProfileRepository = userProfileRepository,
        _graphSettingsRepository = graphSettingsRepository,
        super(const GraphState()) {
    on<GraphEvent>((event, emit) async {
      if (event.isGraphInitialized) {
        await _onGraphInitialized(emit);
      } else if (event.isTargetDateChanged) {
        await _onTargetDateChanged(event.date, emit);
      } else if (event.isMoodsUpdated) {
        await _onMoodsUpdated(emit);
      } else if (event.isShowWorkTimeTriggered) {
        await _onShowWorkTimeTriggered(emit);
      } else if (event.isShowRevenueTriggered) {
        await _onShowRevenueTriggered(emit);
      } else if (event.isTimeRangeModeChanged) {
        await _onTimeRangeModeChanged(event.mode, emit);
      }
    });
  }

  final MoodRepository _moodRepository;

  final user_profile_repository.UserProfileRepository _userProfileRepository;

  final GraphSettingsRepository _graphSettingsRepository;

  Future<void> _onGraphInitialized(Emitter<GraphState> emit) async {
    try {
      final showRevenue = _graphSettingsRepository.readShowRevenue();
      final showWorkTime = _graphSettingsRepository.readShowWorkTime();
      final timeRangeMode = _graphSettingsRepository.readTimeRangeMode();

      emit(
        state.copyWith(
          settings: GraphSettings(
            showRevenue: showRevenue,
            showWorkTime: showWorkTime,
            timeRangeMode: timeRangeMode,
          ),
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e('Failed to read graph settings', ex: e, stacktrace: stackTrace);

      emit(
        state.copyWith(
          settings: const GraphSettings(
            showRevenue: GraphSettingsRepository.showRevenueDefault,
            showWorkTime: GraphSettingsRepository.showWorkTimeDefault,
            timeRangeMode: GraphSettingsRepository.timeRangeModeDefault,
          ),
        ),
      );
    }

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

  Future<void> _onShowRevenueTriggered(Emitter<GraphState> emit) async {
    emit(
      state.copyWith(
        settings: state.settings.copyWith(
          showRevenue: !state.settings.showRevenue,
        ),
      ),
    );
    await _saveShowRevenue(emit, showRevenue: state.settings.showRevenue);
  }

  Future<void> _onShowWorkTimeTriggered(Emitter<GraphState> emit) async {
    emit(
      state.copyWith(
        settings: state.settings.copyWith(
          showWorkTime: !state.settings.showWorkTime,
        ),
      ),
    );
    await _saveShowWorkTime(emit, showWorkTime: state.settings.showWorkTime);
  }

  Future<void> _onTimeRangeModeChanged(
    GraphTimeRangeMode mode,
    Emitter<GraphState> emit,
  ) async {
    emit(
      state.copyWith(
        settings: state.settings.copyWith(
          timeRangeMode: mode,
        ),
      ),
    );
    await _loadMoods(emit);
    await _saveTimeRangeMode(emit, timeRangeMode: mode);
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
        from: state.settings.timeRangeMode.isMonthly
            ? state.targetDate.date.startOfMonth
            : state.targetDate.date.startOfWeek,
        to: state.settings.timeRangeMode.isMonthly
            ? state.targetDate.date.endOfMonth
            : state.targetDate.date.endOfWeek,
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

  Future<void> _saveShowRevenue(
    Emitter<GraphState> emit, {
    required bool showRevenue,
  }) async {
    try {
      emit(
        state.copyWith(
          savingGraphSettingsState: const SavingGraphSettingsState.loading(),
        ),
      );
      await _graphSettingsRepository.saveShowRevenue(showRevenue: showRevenue);
      emit(
        state.copyWith(
          savingGraphSettingsState: const SavingGraphSettingsState.success(),
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e('Failed to save show revenue', ex: e, stacktrace: stackTrace);
      emit(
        state.copyWith(
          savingGraphSettingsState: const SavingGraphSettingsState.error(),
        ),
      );
    }
  }

  Future<void> _saveShowWorkTime(
    Emitter<GraphState> emit, {
    required bool showWorkTime,
  }) async {
    try {
      emit(
        state.copyWith(
          savingGraphSettingsState: const SavingGraphSettingsState.loading(),
        ),
      );
      await _graphSettingsRepository.saveShowWorkTime(
        showWorkTime: showWorkTime,
      );
      emit(
        state.copyWith(
          savingGraphSettingsState: const SavingGraphSettingsState.success(),
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e('Failed to save show work time', ex: e, stacktrace: stackTrace);
      emit(
        state.copyWith(
          savingGraphSettingsState: const SavingGraphSettingsState.error(),
        ),
      );
    }
  }

  Future<void> _saveTimeRangeMode(
    Emitter<GraphState> emit, {
    required GraphTimeRangeMode timeRangeMode,
  }) async {
    try {
      emit(
        state.copyWith(
          savingGraphSettingsState: const SavingGraphSettingsState.loading(),
        ),
      );
      await _graphSettingsRepository.saveTimeRangeMode(
        timeRangeMode: timeRangeMode,
      );
      emit(
        state.copyWith(
          savingGraphSettingsState: const SavingGraphSettingsState.success(),
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e('Failed to save time range mode', ex: e, stacktrace: stackTrace);
      emit(
        state.copyWith(
          savingGraphSettingsState: const SavingGraphSettingsState.error(),
        ),
      );
    }
  }
}
