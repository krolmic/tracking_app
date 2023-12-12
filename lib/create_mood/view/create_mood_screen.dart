import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/create_mood/cubit/create_mood_cubit.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/constants/colors.dart';
import 'package:tracking_app/shared/constants/layout.dart';
import 'package:tracking_app/shared/formz.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

part 'widgets/create_mood_form.dart';
part 'widgets/create_mood_stepper.dart';

class CreateMoodScreen extends StatelessWidget {
  const CreateMoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateMoodCubit(
        moodRepository: getIt.get<MoodRepository>(),
        userProfileRepository: getIt.get<UserProfileRepository>(),
      ),
      child: BlocListener<CreateMoodCubit, FormzSubmissionStatus>(
        listenWhen: (previousState, currentState) =>
            previousState != currentState,
        listener: (context, state) {
          if (state.isSuccess) {
            _showSuccessMessage(context);

            context.go('/home');
          } else if (state.isFailure) {
            _showErrorMessage(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.trackMood),
            centerTitle: true,
          ),
          body: const _CreateMoodView(),
        ),
      ),
    );
  }

  void _showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            '${AppLocalizations.of(context)!.moodTrackedSuccessfully} 🎉',
          ),
          duration: const Duration(seconds: 6),
        ),
      );
  }

  void _showErrorMessage(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            '${AppLocalizations.of(context)!.somethingWentWrong} 🚨',
          ),
        ),
      );
  }
}

class _CreateMoodView extends StatelessWidget {
  const _CreateMoodView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: _CreateMoodForm(
        key: ValueKey('Create mood form'),
      ),
    );
  }
}
