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
import 'package:tracking_app/shared/toast.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/app_dialog.dart';
import 'package:tracking_app/shared/widgets/error_message.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/user_profile/cubit/user_profile_cubit.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

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
      child: MultiBlocListener(
        listeners: [
          BlocListener<SettingsCubit, SettingsState>(
            listenWhen: (previousState, currentState) =>
                previousState.signOutState != currentState.signOutState,
            listener: (context, settingsState) {
              if (settingsState.signOutState.isError) {
                showToast(
                  context,
                  Icons.error_rounded,
                  translations.somethingWentWrong,
                );
              }
            },
          ),
          BlocListener<SettingsCubit, SettingsState>(
            listenWhen: (previousState, currentState) =>
                previousState.accountDeletionState !=
                currentState.accountDeletionState,
            listener: (context, settingsState) {
              if (settingsState.accountDeletionState.isError) {
                showToast(
                  context,
                  Icons.error_rounded,
                  translations.somethingWentWrong,
                );
              }
            },
          ),
          BlocListener<SettingsCubit, SettingsState>(
            listenWhen: (previousState, currentState) =>
                previousState.sendEmailState != currentState.sendEmailState,
            listener: (context, settingsState) {
              if (settingsState.sendEmailState.isError) {
                showToast(
                  context,
                  Icons.error_rounded,
                  translations.somethingWentWrong,
                );
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              translations.settings,
            ),
            centerTitle: true,
          ),
          body: const _SettingsView(),
        ),
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

        return AppDialog(
          title: translations.signOut,
          subTitle: translations.signOutMessage,
          confirmButtonText: translations.signOut.toUpperCase(),
          onConfirm: onConfirm,
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

        return AppDialog(
          title: translations.accountDeletion,
          subTitle: translations.accountDeletionMessage,
          confirmButtonText: translations.delete.toUpperCase(),
          onConfirm: onConfirm,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return BlocBuilder<UserProfileCubit, UserProfileState>(
      buildWhen: (previousUserProfileState, currentUserProfileState) =>
          previousUserProfileState != currentUserProfileState,
      builder: (context, userProfileState) {
        return BlocBuilder<SettingsCubit, SettingsState>(
          buildWhen: (previousState, currentState) =>
              previousState.signOutState != currentState.signOutState ||
              previousState.accountDeletionState !=
                  currentState.accountDeletionState ||
              previousState.sendEmailState != currentState.sendEmailState,
          builder: (context, settingsState) {
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
                            trailing: settingsState.sendEmailState.maybeWhen(
                              loading: () => const SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(),
                              ),
                              orElse: () => const Icon(Icons.mail),
                            ),
                            onTap: settingsState.sendEmailState.isLoading
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
                            child: settingsState.signOutState.maybeWhen(
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
                            child: settingsState.accountDeletionState.maybeWhen(
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
