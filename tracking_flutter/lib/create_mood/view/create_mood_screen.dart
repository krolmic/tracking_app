import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:toastification/toastification.dart';
import 'package:tracking_app/app_settings/bloc/app_settings_bloc.dart';
import 'package:tracking_app/create_mood/bloc/create_mood_bloc.dart';
import 'package:tracking_app/shared/extensions/date_time.dart';
import 'package:tracking_app/shared/extensions/double.dart';
import 'package:tracking_app/shared/formz.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/toast.dart';
import 'package:tracking_app/shared/widgets/app_dots_indicator.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';
import 'package:tracking_app/shared/widgets/time_input.dart';

part 'widgets/create_mood_form.dart';
part 'widgets/create_mood_stepper.dart';

class CreateMoodScreen extends StatelessWidget {
  const CreateMoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    final appSettingsData =
        context.select((AppSettingsBloc bloc) => bloc.state.appSettingsData);

    return BlocListener<CreateMoodBloc, CreateMoodState>(
      listenWhen: (previousState, currentState) =>
          previousState.formStatus != currentState.formStatus,
      listener: (context, state) {
        if (state.formStatus.isSuccess) {
          showToast(
            context: context,
            message: translations.moodTrackedSuccessfully,
          );

          context.read<CreateMoodBloc>().add(
                CreateMoodEvent.formResetRequested(
                  appSettingsData.preSetRevenue,
                  appSettingsData.preSetWorkTime,
                ),
              );

          context.pop();
        } else if (state.formStatus.isFailure) {
          showToast(
            context: context,
            message: translations.somethingWentWrong,
            isError: true,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(translations.trackMood),
              BlocBuilder<CreateMoodBloc, CreateMoodState>(
                buildWhen: (previous, current) =>
                    previous.selectedDate != current.selectedDate,
                builder: (context, state) {
                  if (state.selectedDate == null) {
                    return const TinyLoadingIndicator();
                  }

                  final date = state.selectedDate ?? DateTime.now();

                  return Text(
                    date.getDateString(context),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodySmall,
                  );
                },
              ),
            ],
          ),
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
