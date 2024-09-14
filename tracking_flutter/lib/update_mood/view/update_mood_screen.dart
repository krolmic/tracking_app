import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/app_settings/bloc/app_settings_bloc.dart';
import 'package:tracking_app/delete_mood/cubit/delete_mood_cubit.dart';
import 'package:tracking_app/shared/extensions/date_time.dart';
import 'package:tracking_app/shared/extensions/double.dart';
import 'package:tracking_app/shared/formz.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/toast.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/app_dialog.dart';
import 'package:tracking_app/shared/widgets/app_elevated_button.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';
import 'package:tracking_app/shared/widgets/time_input.dart';
import 'package:tracking_app/update_mood/bloc/update_mood_bloc.dart';

part 'widgets/update_mood_form.dart';

class UpdateMoodScreen extends StatelessWidget {
  const UpdateMoodScreen({
    required this.moodDate,
    super.key,
  });

  final DateTime moodDate;

  Future<void> _showMoodDeletionDialog(
    BuildContext context,
    void Function() onConfirm,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final translations = AppLocalizations.of(context)!;

        return AppDialog(
          title: translations.deleteMood,
          body: Text(translations.deleteMoodMessage),
          confirmButtonText: translations.delete,
          onConfirm: () {
            onConfirm();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return MultiBlocListener(
      listeners: [
        BlocListener<UpdateMoodBloc, UpdateMoodState>(
          listenWhen: (previousUpdateMoodState, currentUpdateMoodState) =>
              previousUpdateMoodState.formStatus !=
              currentUpdateMoodState.formStatus,
          listener: (context, state) {
            if (state.formStatus.isSuccess) {
              showToast(
                context: context,
                message: translations.moodUpdatedSuccessfully,
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
        ),
        BlocListener<DeleteMoodCubit, DeleteMoodState>(
          listenWhen: (previousDeleteMoodState, currentDeleteMoodState) =>
              previousDeleteMoodState != currentDeleteMoodState,
          listener: (context, deleteMoodState) {
            if (deleteMoodState.isSuccess) {
              showToast(
                context: context,
                message: translations.moodDeletedSuccessfully,
              );

              context.pop();
            } else if (deleteMoodState.isError) {
              showToast(
                context: context,
                message: translations.somethingWentWrong,
                isError: true,
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            moodDate.getDateString(context),
            maxLines: 1,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: horizontalPaddingMedium),
              child: BlocBuilder<DeleteMoodCubit, DeleteMoodState>(
                buildWhen: (previousDeleteMoodState, currentDeleteMoodState) =>
                    previousDeleteMoodState != currentDeleteMoodState,
                builder: (context, deleteMoodState) {
                  return deleteMoodState.maybeWhen(
                    loading: () => IconButton(
                      icon: const TinyLoadingIndicator(),
                      onPressed: () {},
                    ),
                    orElse: () => BlocBuilder<UpdateMoodBloc, UpdateMoodState>(
                      buildWhen:
                          (previousUpdateMoodState, currentUpdateMoodState) =>
                              previousUpdateMoodState.mood !=
                              currentUpdateMoodState.mood,
                      builder: (context, state) {
                        return IconButton(
                          icon: const Icon(
                            Iconsax.trash_outline,
                          ),
                          onPressed: () {
                            _showMoodDeletionDialog(
                              context,
                              () {
                                context
                                    .read<DeleteMoodCubit>()
                                    .deleteMood(state.mood!);
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: const _UpdateMoodView(),
      ),
    );
  }
}

class _UpdateMoodView extends StatelessWidget {
  const _UpdateMoodView();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: BlocBuilder<UpdateMoodBloc, UpdateMoodState>(
        buildWhen: (previousState, currentState) =>
            previousState.mood != currentState.mood,
        builder: (context, state) {
          if (state.mood == null) {
            return const Center(
              child: LoadingIndicator(),
            );
          }

          return _UpdateMoodForm(
            key: const Key('Update mood form'),
            mood: state.mood!,
          );
        },
      ),
    );
  }
}
