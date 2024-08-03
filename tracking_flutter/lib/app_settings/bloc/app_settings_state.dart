part of 'app_settings_bloc.dart';

@freezed
class AppSettingsState with _$AppSettingsState {
  const factory AppSettingsState({
    @Default(AppSettingsFormState.none()) AppSettingsFormState appSettingsForm,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus formSubmissionStatus,
    @Default(AppSettingsDataState.initial())
    AppSettingsDataState appSettingsData,
  }) = _AppSettingsState;
}

@freezed
class AppSettingsFormState with _$AppSettingsFormState {
  const factory AppSettingsFormState.none() = _AppSettingsFormNoneState;
  const factory AppSettingsFormState.initialized({
    required AppSettingsFormzState formState,
  }) = _AppSettingsFormInitializedState;
}

extension AppSettingsFormStateX on AppSettingsFormState {
  AppSettingsFormzState get formState =>
      (this as _AppSettingsFormInitializedState).formState;
}

@freezed
class AppSettingsDataState with _$AppSettingsDataState {
  const factory AppSettingsDataState.initial() = _AppSettingsDataInitialState;
  const factory AppSettingsDataState.loading() = _AppSettingsDataLoadingState;
  const factory AppSettingsDataState.success({
    required String currency,
    required Duration preSetWorkTime,
    required double preSetRevenue,
  }) = _AppSettingsDataSuccessState;
  const factory AppSettingsDataState.error() = _AppSettingsDataErrorState;
}

extension AppSettingsDataStateX on AppSettingsDataState {
  bool get isInitialOrLoading =>
      this is _AppSettingsDataInitialState ||
      this is _AppSettingsDataLoadingState;
  bool get isSuccess => this is _AppSettingsDataSuccessState;
  bool get isError => this is _AppSettingsDataErrorState;
  String get currency => (this as _AppSettingsDataSuccessState).currency;
  Duration get preSetWorkTime => isSuccess
      ? (this as _AppSettingsDataSuccessState).preSetWorkTime
      : Duration.zero;
  double get preSetRevenue =>
      isSuccess ? (this as _AppSettingsDataSuccessState).preSetRevenue : 0.0;
}
