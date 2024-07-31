part of 'graph_bloc.dart';

@freezed
class GraphEvent with _$GraphEvent {
  const factory GraphEvent.graphInitialized() = _GraphEventInitialized;
  const factory GraphEvent.targetDateChanged({required DateTime date}) =
      _GraphEventTargetDateChanged;
  const factory GraphEvent.moodsUpdated() = _GraphEventMoodsUpdated;
  const factory GraphEvent.showWorkTimeTriggered() =
      _GraphEventShowWorkTimeTriggered;
  const factory GraphEvent.showRevenueTriggered() =
      _GraphEventShowRevenueTriggered;
}

extension GraphEventX on GraphEvent {
  bool get isGraphInitialized => this is _GraphEventInitialized;
  bool get isTargetDateChanged => this is _GraphEventTargetDateChanged;
  bool get isMoodsUpdated => this is _GraphEventMoodsUpdated;
  bool get isShowWorkTimeTriggered => this is _GraphEventShowWorkTimeTriggered;
  bool get isShowRevenueTriggered => this is _GraphEventShowRevenueTriggered;

  DateTime get date => (this as _GraphEventTargetDateChanged).date;
}
