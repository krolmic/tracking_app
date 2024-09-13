import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tracking_app/shared/iap/revenue_cat_service.dart';
import 'package:user_profile_repository/user_profile_repository.dart'
    as user_profile_repository;

part 'user_profile_cubit.freezed.dart';
part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit({
    required user_profile_repository.UserProfileRepository
        userProfileRepository,
    required RevenueCatService revenueCatService,
  })  : _userProfileRepository = userProfileRepository,
        _revenueCatService = revenueCatService,
        super(const UserProfileState.initial());

  final user_profile_repository.UserProfileRepository _userProfileRepository;
  final RevenueCatService _revenueCatService;

  Future<void> loadUserProfile() async {
    try {
      emit(const UserProfileState.loading());

      final userProfile = await _userProfileRepository.fetchUserProfile();
      await _revenueCatService.identifyUser(userProfile.id);

      emit(
        UserProfileState.loaded(
          id: userProfile.id,
          email: userProfile.email,
          firstName: userProfile.firstName,
          picture: userProfile.picture,
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
