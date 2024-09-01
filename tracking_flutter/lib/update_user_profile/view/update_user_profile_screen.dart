import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/toast.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/app_elevated_button.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';
import 'package:tracking_app/update_user_profile/cubit/update_user_profile_cubit.dart';
import 'package:tracking_app/user_profile/cubit/user_profile_cubit.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

part 'widgets/update_user_profile_form.dart';

enum UpdateUserProfileResult {
  success,
}

class UpdateUserProfileScreen extends StatelessWidget {
  const UpdateUserProfileScreen({
    required this.email,
    required this.firstName,
    super.key,
  });

  final String email;
  final String firstName;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdateUserProfileCubit(
            userProfileRepository: getIt.get<UserProfileRepository>(),
          ),
        ),
      ],
      child: BlocListener<UpdateUserProfileCubit, FormzSubmissionStatus>(
        listenWhen: (previousState, currentState) =>
            previousState != currentState,
        listener: (context, state) {
          if (state.isSuccess) {
            showToast(
              context: context,
              message: translations.profileUpdatedSuccessfully,
            );

            context.read<UserProfileCubit>().loadUserProfile();

            context.pop();
          } else if (state.isFailure) {
            showToast(
              context: context,
              message: translations.somethingWentWrong,
              isError: true,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              translations.personalDetails,
            ),
          ),
          body: _UpdateUserProfileView(
            email: email,
            firstName: firstName,
          ),
        ),
      ),
    );
  }
}

class _UpdateUserProfileView extends StatelessWidget {
  const _UpdateUserProfileView({
    required this.email,
    required this.firstName,
  });

  final String email;
  final String firstName;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      addVerticalPadding: true,
      child: SingleChildScrollView(
        child: _UpdateUserProfileForm(
          email: email,
          firstName: firstName,
        ).animate().fade(duration: animationDuration),
      ),
    );
  }
}
