part of 'delete_mood_cubit.dart';

@freezed
class DeleteMoodState with _$DeleteMoodState {
  const factory DeleteMoodState.initial() = _InitialDeleteMoodState;
  const factory DeleteMoodState.loading() = _LoadingDeleteMoodState;
  const factory DeleteMoodState.success() = _SuccessDeleteMoodState;
  const factory DeleteMoodState.error() = _ErrorDeleteMoodState;
}

extension DeleteMoodStateX on DeleteMoodState {
  bool get isInitial => this is _InitialDeleteMoodState;
  bool get isInProgress => this is _LoadingDeleteMoodState;
  bool get isInitialOrLoading =>
      this is _InitialDeleteMoodState || this is _LoadingDeleteMoodState;
  bool get isSuccess => this is _SuccessDeleteMoodState;
  bool get isError => this is _ErrorDeleteMoodState;
}
