part of 'create_mood_bloc.dart';

@freezed
class CreateMoodEvent with _$CreateMoodEvent {
  const factory CreateMoodEvent.creationSubmitted() = _CreationSubmitted;
  const factory CreateMoodEvent.moodValueChanged(double value) =
      _MoodValueChanged;
  const factory CreateMoodEvent.thingsIAmGratefulFor1Changed(String value) =
      _ThingsIAmGratefulFor1Changed;
  const factory CreateMoodEvent.thingsIAmGratefulFor2Changed(String value) =
      _ThingsIAmGratefulFor2Changed;
  const factory CreateMoodEvent.thingsIAmGratefulFor3Changed(String value) =
      _ThingsIAmGratefulFor3Changed;

  const factory CreateMoodEvent.revenueChanged(String value) = _RevenueChanged;
  const factory CreateMoodEvent.workTimeChanged(Duration value) =
      _WorkTimeChanged;
  const factory CreateMoodEvent.dateChanged(DateTime value) = _DateChanged;
  const factory CreateMoodEvent.formResetRequested(
    double revenue,
    Duration workTime,
  ) = _FormResetRequested;
}

extension CreateMoodEventX on CreateMoodEvent {
  bool get isCreationSubmitted => this is _CreationSubmitted;
  bool get isMoodValueChanged => this is _MoodValueChanged;
  bool get isThingsIAmGratefulFor1Changed =>
      this is _ThingsIAmGratefulFor1Changed;
  bool get isThingsIAmGratefulFor2Changed =>
      this is _ThingsIAmGratefulFor2Changed;
  bool get isThingsIAmGratefulFor3Changed =>
      this is _ThingsIAmGratefulFor3Changed;
  bool get isRevenueChanged => this is _RevenueChanged;
  bool get isWorkTimeChanged => this is _WorkTimeChanged;
  bool get isDateChanged => this is _DateChanged;
  bool get isFormResetRequested => this is _FormResetRequested;
  double get moodValue => (this as _MoodValueChanged).value;
  String get thingsIAmGratefulFor1 =>
      (this as _ThingsIAmGratefulFor1Changed).value;
  String get thingsIAmGratefulFor2 =>
      (this as _ThingsIAmGratefulFor2Changed).value;
  String get thingsIAmGratefulFor3 =>
      (this as _ThingsIAmGratefulFor3Changed).value;
  String get revenue => (this as _RevenueChanged).value;
  Duration get workTime => (this as _WorkTimeChanged).value;
  DateTime get date => (this as _DateChanged).value;
  Duration get formResetWorkTime => (this as _FormResetRequested).workTime;
  double get formResetRevenue => (this as _FormResetRequested).revenue;
}
