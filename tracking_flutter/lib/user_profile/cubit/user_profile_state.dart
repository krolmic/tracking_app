part of 'user_profile_cubit.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState.initial() = UserProfileInitialState;
  const factory UserProfileState.loading() = UserProfileLoadingState;
  const factory UserProfileState.loaded({
    required String id,
    required String email,
    required String firstName,
    String? picture,
  }) = UserProfileSuccessState;
  const factory UserProfileState.error() = UserProfileErrorState;
}

extension UserProfileStateX on UserProfileState {
  bool get isInitialOrLoading =>
      this is UserProfileInitialState || this is UserProfileLoadingState;
  bool get isSuccess => this is UserProfileSuccessState;
  bool get isError => this is UserProfileErrorState;

  String get firstName => (this as UserProfileSuccessState).firstName;
  String? get picture => (this as UserProfileSuccessState).picture;
}
