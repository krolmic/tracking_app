import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_profile_repository/user_profile_repository.dart'
    as user_profile_repository;

part 'user_profile_cubit.freezed.dart';
part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit({
    required user_profile_repository.UserProfileRepository
        userProfileRepository,
  })  : _userProfileRepository = userProfileRepository,
        super(const UserProfileState.initial());

  final user_profile_repository.UserProfileRepository _userProfileRepository;

  Future<void> loadUserProfile() async {
    try {
      emit(const UserProfileState.loading());

      final userProfile = await _userProfileRepository.fetchUserProfile();

      emit(
        UserProfileState.loaded(
          id: userProfile.id,
          email: userProfile.email,
          firstName: userProfile.firstName,
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e('Failed to fetch user profile', ex: e, stacktrace: stackTrace);

      emit(const UserProfileState.error());
    }
  }

  void cleanUserProfile() {
    emit(const UserProfileState.initial());
  }
}
