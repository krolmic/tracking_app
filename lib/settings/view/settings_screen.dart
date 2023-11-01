import 'package:account_repository/account_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/settings/cubit/settings_cubit.dart';
import 'package:tracking_app/shared/constants/colors.dart';
import 'package:tracking_app/shared/constants/layout.dart';
import 'package:tracking_app/shared/router.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/error_message.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/user_profile/cubit/user_profile_cubit.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (context) {
        final userProfileCubit = context.read<UserProfileCubit>();
        if (!userProfileCubit.state.isSuccess) {
          userProfileCubit.loadUserProfile();
        }

        return SettingsCubit(
          userProfileRepository: getIt.get<UserProfileRepository>(),
          moodRepository: getIt.get<MoodRepository>(),
          accountRepository: getIt.get<AccountRepository>(),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
          ),
        ),
        body: const _SettingsView(),
      ),
    );
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();

  Future<void> _showSignOutDialog(
    BuildContext context,
    void Function() onConfirm,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign out'),
          content: const Text(
            "All your data is stored locally and won't be deleted after "
            'signing out.\n\nAre you sure you want to sign out? ',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: Navigator.of(context).pop,
              child: const Text('CANCEL'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: onConfirm,
              child: const Text('SIGN OUT'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAccountDeletionDialog(
    BuildContext context,
    void Function() onConfirm,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Account deletion'),
          content: const Text(
            'Are you sure you want to delete your account? '
            '\n\nThis action cannot be undone.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: Navigator.of(context).pop,
              child: const Text('CANCEL'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: onConfirm,
              child: const Text('DELETE'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, userProfileState) {
        return BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, settingsState) {
            if (settingsState.signOutState.isError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('Signout failed. Please try again.'),
                    duration: Duration(seconds: 6),
                  ),
                );
            } else if (settingsState.accountDeletionState.isError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('Something went wrong. Please try again.'),
                    duration: Duration(seconds: 6),
                  ),
                );
            }
          },
          listenWhen: (previous, current) =>
              previous.signOutState != current.signOutState ||
              previous.accountDeletionState != current.accountDeletionState,
          builder: (context, state) {
            return BaseView(
              child: userProfileState.maybeWhen(
                orElse: () => const LoadingIndicator(),
                error: () => const ErrorMessage(
                  message: 'Failed to load user profile',
                  // onRetry: () {
                  //   context.read<SettingsCubit>().loadUserProfile();
                  // },
                ),
                loaded: (id, email, firstName) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 200,
                            child: CircleAvatar(
                              backgroundColor: primarySwatch,
                              radius: 100,
                              child: firstName.isEmpty
                                  ? const Icon(
                                      Icons.person,
                                      size: 50,
                                    )
                                  : Text(
                                      firstName[0],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        Center(
                          child: Text(
                            email,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(
                          height: verticalPaddingSmall,
                        ),
                        Center(
                          child: Text(
                            firstName,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        Text(
                          'Account',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        ListTile(
                          textColor: primarySwatch,
                          iconColor: primarySwatch,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          tileColor: const Color(0xFF4d4e42),
                          title: const Text('Personal details'),
                          trailing: const Icon(Icons.edit),
                          onTap: () => context.push(
                            '/settings/update-user-profile',
                            extra: UpdateUserProfileParams(
                              email: email,
                              firstName: firstName,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        Text(
                          'General',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        ListTile(
                          textColor: primarySwatch,
                          iconColor: primarySwatch,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          tileColor: const Color(0xFF4d4e42),
                          title: const Text('Support'),
                          trailing: const Icon(Icons.mail),
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: verticalPaddingMedium,
                        ),
                        ListTile(
                          textColor: primarySwatch,
                          iconColor: primarySwatch,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          tileColor: const Color(0xFF4d4e42),
                          title: const Text('Terms of service'),
                          trailing: const Icon(Icons.description),
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        Center(
                          child: CupertinoButton(
                            onPressed: () => _showSignOutDialog(
                              context,
                              context.read<SettingsCubit>().signOut,
                            ),
                            child: state.signOutState.maybeWhen(
                              orElse: () => const Text('Sign out'),
                              loading: () => const LoadingIndicator(),
                            ),
                          ),
                        ),
                        Center(
                          child: CupertinoButton(
                            onPressed: () => _showAccountDeletionDialog(
                              context,
                              context.read<SettingsCubit>().deleteUserAccount,
                            ),
                            child: state.accountDeletionState.maybeWhen(
                              orElse: () => const Text('Delete account'),
                              loading: () => const LoadingIndicator(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
