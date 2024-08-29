part of 'privacy_policy_cubit.dart';

@freezed
class PrivacyPolicyState with _$PrivacyPolicyState {
  const factory PrivacyPolicyState.initial() = _PrivacyPolicyInitialState;
  const factory PrivacyPolicyState.loading() = _PrivacyPolicyLoadingState;
  const factory PrivacyPolicyState.success(String content) =
      _PrivacyPolicySuccessState;
  const factory PrivacyPolicyState.error() = _PrivacyPolicyErrorState;
}
