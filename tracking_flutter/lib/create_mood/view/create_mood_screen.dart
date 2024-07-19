import 'package:animated_emoji/animated_emoji.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/create_mood/cubit/create_mood_cubit.dart';
import 'package:tracking_app/shared/formz.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/toast.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';

part 'widgets/create_mood_form.dart';
part 'widgets/create_mood_stepper.dart';

class CreateMoodScreen extends StatelessWidget {
  const CreateMoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return BlocListener<CreateMoodCubit, FormzSubmissionStatus>(
      listenWhen: (previousState, currentState) =>
          previousState != currentState,
      listener: (context, state) {
        if (state.isSuccess) {
          showToast(
            context,
            Icons.done_rounded,
            translations.moodTrackedSuccessfully,
          );

          context.go('/home');
        } else if (state.isFailure) {
          showToast(
            context,
            Icons.error_rounded,
            translations.somethingWentWrong,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(translations.trackMood),
          centerTitle: true,
        ),
        body: const _CreateMoodView(),
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
