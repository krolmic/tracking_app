part of 'update_mood_bloc.dart';

@freezed
class UpdateMoodState with _$UpdateMoodState {
  const factory UpdateMoodState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formStatus,
    @Default(MoodFormzState()) MoodFormzState moodFormState,
    Mood? mood,
  }) = _UpdateMoodState;
}
