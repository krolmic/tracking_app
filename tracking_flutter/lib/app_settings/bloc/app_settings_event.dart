part of 'app_settings_bloc.dart';

@freezed
class AppSettingsEvent with _$AppSettingsEvent {
  const factory AppSettingsEvent.settingsInitialized() = _SettingsInitialized;
  const factory AppSettingsEvent.settingsFormInitialized() =
      _SettingsFormInitialized;
  const factory AppSettingsEvent.currencyChanged(String currency) =
      _CurrencyChanged;
  const factory AppSettingsEvent.revenueChanged(String revenue) =
      _RevenueChanged;
  const factory AppSettingsEvent.workTimeChanged(Duration workTime) =
      _WorkTimeChanged;
  const factory AppSettingsEvent.settingsFromSubmitted() =
      _SettingsFormSubmitted;
}

extension AppSettingsEventX on AppSettingsEvent {
  bool get isSettingsFormSubmitted => this is _SettingsFormSubmitted;
  bool get isSettingsFormInitialized => this is _SettingsFormInitialized;
  bool get isSettingsInitialized => this is _SettingsInitialized;
  bool get isRevenueChanged => this is _RevenueChanged;
  bool get isWorkTimeChanged => this is _WorkTimeChanged;
  bool get isCurrencyChanged => this is _CurrencyChanged;

  String get currency => (this as _CurrencyChanged).currency;

  Duration get workTime => (this as _WorkTimeChanged).workTime;

  String get revenue => (this as _RevenueChanged).revenue;
}
