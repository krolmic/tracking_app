import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:formz/formz.dart';
import 'package:mood_repository/mood_repository.dart';

class UpdateMoodCubit extends Cubit<FormzSubmissionStatus> {
  UpdateMoodCubit({
    required MoodRepository moodRepository,
  })  : _moodRepository = moodRepository,
        super(FormzSubmissionStatus.initial);

  final MoodRepository _moodRepository;

  Future<void> updateMood(
    Mood mood, {
    int? value,
    List<String>? thingsIAmGratefulAbout,
    String? diary,
    double? revenue,
    Duration? workTime,
  }) async {
    try {
      emit(FormzSubmissionStatus.inProgress);

      await _moodRepository.updateMood(
        mood,
        value: value,
        diary: diary,
        thingsIAmGratefulAbout: thingsIAmGratefulAbout,
        revenue: revenue,
        workTime: workTime,
      );

      emit(FormzSubmissionStatus.success);
    } catch (e, stackTrace) {
      Fimber.e('Updating mood failed', ex: e, stacktrace: stackTrace);
      emit(FormzSubmissionStatus.failure);
    }
  }
}
