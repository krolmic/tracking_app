part of 'graph_bloc.dart';

@freezed
class GraphState with _$GraphState {
  const factory GraphState({
    @Default(GraphMoodsState.initial()) GraphMoodsState moodsState,
    @Default(GraphTargetDateState.initial()) GraphTargetDateState targetDate,
    @Default(GraphTimeRangeMode.monthly()) GraphTimeRangeMode timeRangeMode,
    @Default(
      GraphSettings(
        showRevenue: false,
        showWorkTime: true,
      ),
    )
    GraphSettings settings,
  }) = _GraphState;
}

extension GraphStateX on GraphState {
  bool get isInitialOrLoading => moodsState.isInitial || moodsState.isLoading;
  bool get isError => moodsState.isError;
  bool get isSuccess => moodsState.isSuccess;
}

@freezed
class GraphTimeRangeMode with _$GraphTimeRangeMode {
  const factory GraphTimeRangeMode.monthly() = GraphTimeRangeMonthlyMode;
  const factory GraphTimeRangeMode.weekly() = GraphTimeRangeWeeklyMode;
}

@freezed
class GraphSettings with _$GraphSettings {
  const factory GraphSettings({
    required bool showRevenue,
    required bool showWorkTime,
  }) = _GraphSettings;
}

@freezed
class GraphTargetDateState with _$GraphTargetDateState {
  const factory GraphTargetDateState.initial() = GraphTargetDateInitialState;
  const factory GraphTargetDateState.set({
    required DateTime date,
  }) = GraphTargetDateSetState;
}

extension GraphTargetDateStateX on GraphTargetDateState {
  bool get isInitial => this is GraphTargetDateInitialState;
  bool get isSet => this is GraphTargetDateSetState;

  DateTime get date =>
      isSet ? (this as GraphTargetDateSetState).date : DateTime.now();
}

@freezed
class GraphMoodsState with _$GraphMoodsState {
  const factory GraphMoodsState.initial() = GraphMoodsInitialState;
  const factory GraphMoodsState.loading() = GraphMoodsLoadingState;
  const factory GraphMoodsState.loaded({
    required List<Mood> moods,
  }) = GraphMoodsSuccessState;
  const factory GraphMoodsState.error() = GraphMoodsErrorState;
}

extension GraphMoodsStateX on GraphMoodsState {
  bool get isInitial => this is GraphMoodsInitialState;
  bool get isLoading => this is GraphMoodsLoadingState;
  bool get isError => this is GraphMoodsErrorState;
  bool get isSuccess => this is GraphMoodsSuccessState;

  List<Mood> get moods =>
      isSuccess ? (this as GraphMoodsSuccessState).moods : [];

  List<Mood> get moodsWithTrackedRevenue =>
      moods.where((mood) => mood.revenue != null).toList();

  List<Mood> get moodsWithTrackedWorkTime =>
      moods.where((mood) => mood.workTime != null).toList();

  int? get greatestMoodValue {
    if (moods.isEmpty) {
      return null;
    }

    return moods.fold<int>(0, (previousValue, element) {
      return element.value > previousValue ? element.value : previousValue;
    });
  }

  double? get greatestRevenue {
    final moods = moodsWithTrackedRevenue;
    if (moods.isEmpty) {
      return null;
    }

    return moods.fold<double>(0, (previousValue, element) {
      return element.revenue! > previousValue
          ? element.revenue!
          : previousValue;
    });
  }

  Duration? get greatestWorkTime {
    final moods = moodsWithTrackedWorkTime;
    if (moods.isEmpty) {
      return null;
    }

    return moods.fold<Duration>(Duration.zero, (previousValue, element) {
      return element.workTime! > previousValue
          ? element.workTime!
          : previousValue;
    });
  }
}
