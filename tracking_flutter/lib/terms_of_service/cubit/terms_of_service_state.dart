part of 'terms_of_service_cubit.dart';

@freezed
class TermsOfServiceState with _$TermsOfServiceState {
  const factory TermsOfServiceState.initial() = _TermsOfServiceInitialState;
  const factory TermsOfServiceState.loading() = _TermsOfServiceLoadingState;
  const factory TermsOfServiceState.success(String content) =
      _TermsOfServiceSuccessState;
  const factory TermsOfServiceState.error() = _TermsOfServiceErrorState;
}
