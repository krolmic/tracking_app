part of 'update_mood_bloc.dart';

@freezed
class UpdateMoodEvent with _$UpdateMoodEvent {
  const factory UpdateMoodEvent.updateSubmitted(Mood mood) = _UpdateSubmitted;
  const factory UpdateMoodEvent.moodValueChanged(double value) =
      _MoodValueChanged;
  const factory UpdateMoodEvent.thingsIAmGratefulFor1Changed(String value) =
      _ThingsIAmGratefulFor1Changed;
  const factory UpdateMoodEvent.thingsIAmGratefulFor2Changed(String value) =
      _ThingsIAmGratefulFor2Changed;
  const factory UpdateMoodEvent.thingsIAmGratefulFor3Changed(String value) =
      _ThingsIAmGratefulFor3Changed;
  const factory UpdateMoodEvent.revenueChanged(String value) = _RevenueChanged;
  const factory UpdateMoodEvent.workTimeChanged(Duration value) =
      _WorkTimeChanged;
  const factory UpdateMoodEvent.moodSelected(Mood mood) = _MoodSelected;
}

extension UpdateMoodEventX on UpdateMoodEvent {
  bool get isUpdateSubmitted => this is _UpdateSubmitted;
  bool get isMoodValueChanged => this is _MoodValueChanged;
  bool get isThingsIAmGratefulFor1Changed =>
      this is _ThingsIAmGratefulFor1Changed;
  bool get isThingsIAmGratefulFor2Changed =>
      this is _ThingsIAmGratefulFor2Changed;
  bool get isThingsIAmGratefulFor3Changed =>
      this is _ThingsIAmGratefulFor3Changed;
  bool get isRevenueChanged => this is _RevenueChanged;
  bool get isWorkTimeChanged => this is _WorkTimeChanged;
  bool get isMoodSelected => this is _MoodSelected;

  double get moodValue => (this as _MoodValueChanged).value;
  String get thingsIAmGratefulFor1 =>
      (this as _ThingsIAmGratefulFor1Changed).value;
  String get thingsIAmGratefulFor2 =>
      (this as _ThingsIAmGratefulFor2Changed).value;
  String get thingsIAmGratefulFor3 =>
      (this as _ThingsIAmGratefulFor3Changed).value;
  String get revenue => (this as _RevenueChanged).value;
  Duration get workTime => (this as _WorkTimeChanged).value;
  Mood get selectedMood => (this as _MoodSelected).mood;
  Mood get moodtoUpdate => (this as _UpdateSubmitted).mood;
}
