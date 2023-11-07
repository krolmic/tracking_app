import 'package:account_repository/account_repository.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:email_repository/email_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/settings/cubit/settings_cubit.dart';
import 'package:tracking_app/shared/constants/colors.dart';
import 'package:tracking_app/shared/constants/layout.dart';
import 'package:tracking_app/shared/constants/misc.dart';
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
          emailRepository: getIt.get<EmailRepository>(),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.settings,
          ),
          centerTitle: true,
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
                settingsState.accountDeletionState.isError ||
                settingsState.sendEmailState.isError) {
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
              previous.accountDeletionState != current.accountDeletionState ||
              previous.sendEmailState != current.sendEmailState,
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
                              backgroundColor: primarySwatch.shade300,
                              radius: 100,
                              child: const AnimatedEmoji(
                                AnimatedEmojis.otter,
                                size: 128,
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
                        Card(
                          elevation: 5,
                          shadowColor: primarySwatch.shade100,
                          child: ListTile(
                            textColor: primarySwatch,
                            iconColor: primarySwatch,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
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
                        Card(
                          elevation: 5,
                          shadowColor: primarySwatch.shade100,
                          child: ListTile(
                            textColor: primarySwatch,
                            iconColor: primarySwatch,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            title: Text(translations.support),
                            trailing: state.sendEmailState.maybeWhen(
                              loading: () => const SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(),
                              ),
                              orElse: () => const Icon(Icons.mail),
                            ),
                            onTap: state.sendEmailState.isLoading
                                ? null
                                : () => context.read<SettingsCubit>().sendEmail(
                                      recipient: supportEmailAddress,
                                      subject: '',
                                      body: '',
                                    ),
                          ),
                        ),
                        const SizedBox(
                          height: verticalPaddingMedium,
                        ),
                        Card(
                          elevation: 5,
                          shadowColor: primarySwatch.shade100,
                          child: ListTile(
                            textColor: primarySwatch,
                            iconColor: primarySwatch,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            title: Text(translations.termsOfService),
                            trailing: const Icon(Icons.description),
                            onTap: () {
                              context.go('/settings/terms-of-service');
                            },
                          ),
                        ),
                        const SizedBox(
                          height: verticalPaddingMedium,
                        ),
                        Card(
                          elevation: 5,
                          shadowColor: primarySwatch.shade100,
                          child: ListTile(
                            textColor: primarySwatch,
                            iconColor: primarySwatch,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            title: Text(translations.privacyPolicy),
                            trailing: const Icon(Icons.description),
                            onTap: () {
                              context.go('/settings/privacy-policy');
                            },
                          ),
                        ),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () => _showSignOutDialog(
                              context,
                              context.read<SettingsCubit>().signOut,
                            ),
                            child: state.signOutState.maybeWhen(
                              orElse: () => Text(translations.signOut),
                              loading: () => const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () => _showAccountDeletionDialog(
                              context,
                              context.read<SettingsCubit>().deleteUserAccount,
                            ),
                            child: state.accountDeletionState.maybeWhen(
                              orElse: () => Text(
                                translations.deleteAccount,
                                style: TextStyle(
                                  color: primarySwatch.shade300,
                                ),
                              ),
                              loading: () => const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(),
                              ),
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
