import 'package:account_repository/account_repository.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:email_repository/email_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/settings/cubit/settings_cubit.dart';
import 'package:tracking_app/shared/constants.dart';
import 'package:tracking_app/shared/router/routes_names.dart';
import 'package:tracking_app/shared/router/routes_parameters.dart';
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
          confirmButtonText: translations.signOut,
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
          confirmButtonText: translations.delete,
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
        return BaseView(
          addVerticalPadding: true,
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
                    Center(
                      child: SizedBox(
                        height: 150,
                        child: CircleAvatar(
                          backgroundColor: AppColors.lightBlueAccent,
                          radius: 75,
                          child: const AnimatedEmoji(
                            AnimatedEmojis.otter,
                            size: 75,
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                      onTap: () => context.pushNamed(
                        RoutesNames.updateUserProfile,
                        extra: UpdateUserProfileRouteParameters(
                          email: email,
                          firstName: firstName,
                        ),
                      ),
                    ),
                    const VerticalSpacing.extraLarge(),
                    Text(
                      translations.general,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const VerticalSpacing.large(),
                    Tile(
                      icon: Iconsax.edit_2_outline,
                      title: translations.appSettings,
                      leading: const Icon(Iconsax.setting_4_bold),
                      onTap: () => context.goNamed(
                        RoutesNames.appSettings,
                      ),
                    ),
                    BlocBuilder<SettingsCubit, SettingsState>(
                      buildWhen: (previousState, currentState) =>
                          previousState.sendEmailState !=
                          currentState.sendEmailState,
                      builder: (context, state) {
                        return Tile(
                          icon: Icons.mail_outline,
                          title: translations.support,
                          leading: const Icon(Iconsax.support_bold),
                          onTap: () => context.read<SettingsCubit>().sendEmail(
                                recipient: supportEmailAddress,
                                subject: '',
                                body: '',
                              ),
                          isLoading: state.sendEmailState.isLoading,
                        );
                      },
                    ),
                    Tile(
                      title: translations.termsOfService,
                      leading: const Icon(Iconsax.document_text_1_bold),
                      onTap: () => context.goNamed(
                        RoutesNames.termsOfService,
                      ),
                    ),
                    Tile(
                      title: translations.privacyPolicy,
                      leading: const Icon(Iconsax.document_text_1_bold),
                      onTap: () => context.goNamed(
                        RoutesNames.privacyPolicy,
                      ),
                    ),
                    const VerticalSpacing.extraLarge(),
                    Center(
                      child: BlocBuilder<SettingsCubit, SettingsState>(
                        buildWhen: (previousState, currentState) =>
                            previousState.signOutState !=
                            currentState.signOutState,
                        builder: (context, state) {
                          return TextButton(
                            onPressed: () => _onSignOutPressed(context),
                            child: state.signOutState.maybeWhen(
                              orElse: () => Text(translations.signOut),
                              loading: () => const TinyLoadingIndicator(),
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: BlocBuilder<SettingsCubit, SettingsState>(
                        buildWhen: (previousState, currentState) =>
                            previousState.accountDeletionState !=
                            currentState.accountDeletionState,
                        builder: (context, state) {
                          return TextButton(
                            onPressed: () => _onDeleteAccountPressed(context),
                            child: state.accountDeletionState.maybeWhen(
                              loading: () => const TinyLoadingIndicator(),
                              orElse: () => Text(
                                translations.deleteAccount,
                                style: const TextStyle(
                                  color: AppColors.lightGrey,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
