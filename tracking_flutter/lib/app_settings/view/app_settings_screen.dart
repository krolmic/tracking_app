import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tracking_app/app_settings/bloc/app_settings_bloc.dart';
import 'package:tracking_app/shared/currencies.dart';
import 'package:tracking_app/shared/extensions/double.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/toast.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/app_elevated_button.dart';
import 'package:tracking_app/shared/widgets/drop_down.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';
import 'package:tracking_app/shared/widgets/time_input.dart';

part 'widgets/app_settings_form.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return BlocListener<AppSettingsBloc, AppSettingsState>(
      listenWhen: (previousState, currentState) =>
          previousState.formSubmissionStatus !=
          currentState.formSubmissionStatus,
      listener: (context, state) {
        if (state.formSubmissionStatus.isSuccess) {
          showToast(
            context: context,
            message: translations.appSettingsSaved,
          );

          context.pop();
        } else if (state.formSubmissionStatus.isFailure) {
          showToast(
            context: context,
            message: translations.somethingWentWrong,
            isError: true,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(translations.appSettings)),
        body: _AppSettingsView(),
      ),
    );
  }
}

class _AppSettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      addVerticalPadding: true,
      child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
        buildWhen: (previousState, currentState) =>
            previousState.appSettingsForm != currentState.appSettingsForm,
        builder: (context, state) {
          return state.appSettingsForm.when(
            none: () => const Center(
              child: LoadingIndicator(),
            ),
            initialized: (_) =>
                _AppSettingsForm().animate().fade(duration: animationDuration),
          );
        },
      ),
    );
  }
}
