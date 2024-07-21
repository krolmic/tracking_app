part of 'create_mood_bloc.dart';

@freezed
class CreateMoodState with _$CreateMoodState {
  const factory CreateMoodState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formStatus,
    @Default(MoodFormzState()) MoodFormzState moodFormState,
    // Add other fields here
  }) = _CreateMoodState;
}
