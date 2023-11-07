import 'dart:async';

import 'package:account_repository/account_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:user_profile_repository/user_profile_repository.dart'
    as user_profile_repository;

part 'settings_cubit.freezed.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required user_profile_repository.UserProfileRepository
        userProfileRepository,
    required AccountRepository accountRepository,
    required MoodRepository moodRepository,
  })  : _userProfileRepository = userProfileRepository,
        _accountRepository = accountRepository,
        _moodRepository = moodRepository,
        super(const SettingsState());

  final user_profile_repository.UserProfileRepository _userProfileRepository;

  final AccountRepository _accountRepository;

  final MoodRepository _moodRepository;

  Future<void> signOut() async {
    try {
      emit(
        state.copyWith(
          signOutState: const SignOutState.loading(),
        ),
      );

      await _accountRepository.signOut();
    } catch (e, stackTrace) {
      Fimber.e('Sign out failed', ex: e, stacktrace: stackTrace);

      emit(
        state.copyWith(
          signOutState: const SignOutState.error(),
        ),
      );
    }
  }

  Future<void> deleteUserAccount() async {
    try {
      emit(
        state.copyWith(
          accountDeletionState: const AccountDeletionState.loading(),
        ),
      );

      final userId = await _userProfileRepository.getCurrentUserId();

      await _moodRepository.deleteMoods(userId: userId);

      await _accountRepository.deleteAccount();

      emit(
        state.copyWith(
          accountDeletionState: const AccountDeletionState.success(),
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e('Failed to delete user account', ex: e, stacktrace: stackTrace);

      emit(
        state.copyWith(
          accountDeletionState: const AccountDeletionState.error(),
        ),
      );
    }
  }
}
