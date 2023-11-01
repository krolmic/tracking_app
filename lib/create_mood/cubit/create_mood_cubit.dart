import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:user_profile_repository/user_profile_repository.dart'
    as user_profile_repository;

class CreateMoodCubit extends Cubit<FormzSubmissionStatus> {
  CreateMoodCubit({
    required MoodRepository moodRepository,
    required user_profile_repository.UserProfileRepository
        userProfileRepository,
  })  : _moodRepository = moodRepository,
        _userProfileRepository = userProfileRepository,
        super(FormzSubmissionStatus.initial);

  final MoodRepository _moodRepository;

  final user_profile_repository.UserProfileRepository _userProfileRepository;

  Future<void> createMood({
    required int value,
    List<String>? thingsIAmGratefulAbout,
    String? diary,
  }) async {
    try {
      emit(FormzSubmissionStatus.inProgress);

      final userId = await _userProfileRepository.getCurrentUserId();
      await _moodRepository.createMood(
        userId: userId,
        createdOn: DateTime.now(),
        value: value,
        diary: diary,
        thingsIAmGratefulAbout: thingsIAmGratefulAbout,
      );

      emit(FormzSubmissionStatus.success);
    } catch (e, stackTrace) {
      emit(FormzSubmissionStatus.failure);
    }
  }
}
