import 'package:account_repository/account_repository.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:email_repository/email_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/settings/cubit/settings_cubit.dart';
import 'package:tracking_app/shared/constants.dart';
import 'package:tracking_app/shared/router.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/toast.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/app_dialog.dart';
import 'package:tracking_app/shared/widgets/error_message.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';
import 'package:tracking_app/shared/widgets/tile.dart';
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
                  Icons.error,
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
                  Icons.error,
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
                  Icons.error,
                  translations.somethingWentWrong,
                );
              }
            },
          ),
        ],
        child: const Scaffold(
          body: _SettingsView(),
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

  Future<void> _onSignOutPressed(BuildContext context) async {
    await _showSignOutDialog(
      context,
      () async {
        final userProfileCubit = context.read<UserProfileCubit>();
        final settingsCubit = context.read<SettingsCubit>();

        final userIsSignedOut = await settingsCubit.signOut();
        if (userIsSignedOut) {
          userProfileCubit.cleanUserProfile();
        }
      },
    );
  }

  Future<void> _onDeleteAccountPressed(BuildContext context) async {
    await _showAccountDeletionDialog(
      context,
      () async {
        final userProfileCubit = context.read<UserProfileCubit>();
        final settingsCubit = context.read<SettingsCubit>();

        final userAccountIsDeleted = await settingsCubit.deleteUserAccount();
        if (userAccountIsDeleted) {
          userProfileCubit.cleanUserProfile();
        }
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
                orElse: () => const Center(child: LoadingIndicator()),
                error: () => ErrorMessage(
                  onRefresh: context.read<UserProfileCubit>().loadUserProfile,
                ),
                loaded: (id, email, firstName) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalSpacing.large(),
                        Center(
                          child: SizedBox(
                            height: 200,
                            child: CircleAvatar(
                              backgroundColor: lightBlueAccent,
                              radius: 100,
                              child: const AnimatedEmoji(
                                AnimatedEmojis.otter,
                                size: 128,
                              ),
                            ),
                          ),
                        ),
                        const VerticalSpacing.large(),
                        Center(
                          child: Text(
                            email,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(
                          height: verticalPaddingSmall,
                        ),
                        Center(
                          child: Text(
                            firstName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        const VerticalSpacing.extraLarge(),
                        Text(
                          translations.account,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const VerticalSpacing.large(),
                        Tile(
                          icon: Iconsax.edit_2_outline,
                          title: translations.personalDetails,
                          leading: const Icon(Iconsax.profile_circle_bold),
                          onTap: () => context.push(
                            '/settings/update-user-profile',
                            extra: UpdateUserProfileParams(
                              email: email,
                              firstName: firstName,
                            ),
                          ),
                        ).animate().fadeIn(duration: animationDuration),
                        const VerticalSpacing.extraLarge(),
                        Text(
                          translations.general,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const VerticalSpacing.large(),
                        Tile(
                          icon: Icons.mail_outline,
                          title: translations.support,
                          leading: const Icon(Iconsax.support_bold),
                          onTap: () => context.read<SettingsCubit>().sendEmail(
                                recipient: supportEmailAddress,
                                subject: '',
                                body: '',
                              ),
                          isLoading: settingsState.sendEmailState.isLoading,
                        ).animate().fadeIn(duration: animationDuration),
                        const VerticalSpacing.medium(),
                        Tile(
                          title: translations.termsOfService,
                          leading: const Icon(Iconsax.document_text_1_bold),
                          onTap: () => context.go('/settings/terms-of-service'),
                        ).animate().fadeIn(duration: animationDuration),
                        const VerticalSpacing.medium(),
                        Tile(
                          title: translations.privacyPolicy,
                          leading: const Icon(Iconsax.document_text_1_bold),
                          onTap: () => context.go('/settings/privacy-policy'),
                        ).animate().fadeIn(duration: animationDuration),
                        const VerticalSpacing.extraLarge(),
                        Center(
                          child: TextButton(
                            onPressed: () => _onSignOutPressed(context),
                            child: settingsState.signOutState.maybeWhen(
                              orElse: () => Text(translations.signOut),
                              loading: () => const TinyLoadingIndicator(),
                            ),
                          ),
                        ).animate().fadeIn(duration: animationDuration),
                        Center(
                          child: TextButton(
                            onPressed: () => _onDeleteAccountPressed(context),
                            child: settingsState.accountDeletionState.maybeWhen(
                              orElse: () => Text(
                                translations.deleteAccount,
                                style: const TextStyle(
                                  color: lightGrey,
                                ),
                              ),
                              loading: () => const TinyLoadingIndicator(),
                            ),
                          ),
                        ).animate().fadeIn(duration: animationDuration),
                        const VerticalSpacing.large(),
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
