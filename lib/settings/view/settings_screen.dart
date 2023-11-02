import 'package:account_repository/account_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          title: Text(
            AppLocalizations.of(context)!.settings,
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
        final translations = AppLocalizations.of(context)!;

        return AlertDialog(
          title: Text(translations.signOut),
          content: Text(translations.signOutMessage),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: Navigator.of(context).pop,
              child: Text(translations.cancel.toUpperCase()),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: onConfirm,
              child: Text(translations.signOut.toUpperCase()),
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
        final translations = AppLocalizations.of(context)!;

        return AlertDialog(
          title: Text(translations.accountDeletion),
          content: Text(translations.accountDeletionMessage),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: Navigator.of(context).pop,
              child: Text(translations.cancel.toUpperCase()),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: onConfirm,
              child: Text(translations.delete.toUpperCase()),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, userProfileState) {
        return BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, settingsState) {
            if (settingsState.signOutState.isError ||
                settingsState.accountDeletionState.isError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(translations.somethingWentWrong),
                    duration: const Duration(seconds: 6),
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
                error: () => ErrorMessage(
                  onRefresh: context.read<UserProfileCubit>().loadUserProfile,
                ),
                loaded: (id, email, firstName) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
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
                          translations.account,
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
                          title: Text(translations.personalDetails),
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
                          translations.general,
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
                          title: Text(translations.support),
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
                          title: Text(translations.termsOfService),
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
                              orElse: () => Text(translations.signOut),
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
                              orElse: () => Text(translations.deleteAccount),
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
