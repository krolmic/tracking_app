part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(SendEmailState.initial()) SendEmailState sendEmailState,
    @Default(SignOutState.initial()) SignOutState signOutState,
    @Default(AccountDeletionState.initial())
    AccountDeletionState accountDeletionState,
    @Default(UpdatePictureState.initial())
    UpdatePictureState updatePictureState,
  }) = _SettingsState;
}

@freezed
class SignOutState with _$SignOutState {
  const factory SignOutState.initial() = SignOutInitialState;
  const factory SignOutState.loading() = SignOutLoadingState;
  const factory SignOutState.error() = SignOutErrorState;
}

extension SignOutStateX on SignOutState {
  bool get isInitial => this is SignOutInitialState;
  bool get isLoading => this is SignOutLoadingState;
  bool get isError => this is SignOutErrorState;
}

@freezed
class AccountDeletionState with _$AccountDeletionState {
  const factory AccountDeletionState.initial() = AccountDeletionInitialState;
  const factory AccountDeletionState.loading() = AccountDeletionLoadingState;
  const factory AccountDeletionState.success() = AccountDeletionSuccessState;
  const factory AccountDeletionState.error() = AccountDeletionErrorState;
}

extension AccountDeletionStateX on AccountDeletionState {
  bool get isInitial => this is AccountDeletionInitialState;
  bool get isLoading => this is AccountDeletionLoadingState;
  bool get isSuccess => this is AccountDeletionSuccessState;
  bool get isError => this is AccountDeletionErrorState;
}

@freezed
class SendEmailState with _$SendEmailState {
  const factory SendEmailState.initial() = SendEmailStateInitialState;
  const factory SendEmailState.loading() = SendEmailStateLoadingState;
  const factory SendEmailState.success() = SendEmailStateSuccessState;
  const factory SendEmailState.error() = SendEmailStateErrorState;
}

extension SendEmailStateX on SendEmailState {
  bool get isInitial => this is SendEmailStateInitialState;
  bool get isLoading => this is SendEmailStateLoadingState;
  bool get isSuccess => this is SendEmailStateSuccessState;
  bool get isError => this is SendEmailStateErrorState;
}

@freezed
class UpdatePictureState with _$UpdatePictureState {
  const factory UpdatePictureState.initial() = UpdatePictureStateInitialState;
  const factory UpdatePictureState.loading() = UpdatePictureStateLoadingState;
  const factory UpdatePictureState.success() = UpdatePictureStateSuccessState;
  const factory UpdatePictureState.error() = UpdatePictureStateErrorState;
}

extension UpdatePictureStateX on UpdatePictureState {
  bool get isInitial => this is UpdatePictureStateInitialState;
  bool get isLoading => this is UpdatePictureStateLoadingState;
  bool get isSuccess => this is UpdatePictureStateSuccessState;
  bool get isError => this is UpdatePictureStateErrorState;
}
