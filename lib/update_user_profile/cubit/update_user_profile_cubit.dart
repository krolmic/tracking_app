import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:formz/formz.dart';
import 'package:user_profile_repository/user_profile_repository.dart'
    as user_profile_repository;

class UpdateUserProfileCubit extends Cubit<FormzSubmissionStatus> {
  UpdateUserProfileCubit({
    required user_profile_repository.UserProfileRepository
        userProfileRepository,
  })  : _userProfileRepository = userProfileRepository,
        super(FormzSubmissionStatus.initial);

  final user_profile_repository.UserProfileRepository _userProfileRepository;

  Future<void> updateUserProfile({
    required String firstName,
  }) async {
    try {
      emit(FormzSubmissionStatus.inProgress);

      await _userProfileRepository.updateUserProfile(
        firstName: firstName,
      );

      emit(FormzSubmissionStatus.success);
    } catch (e, stackTrace) {
      Fimber.e('Updating user profile failed', ex: e, stacktrace: stackTrace);
      emit(FormzSubmissionStatus.failure);
    }
  }
}
