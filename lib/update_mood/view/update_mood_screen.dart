import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/delete_mood/cubit/delete_mood_cubit.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/date_time.dart';
import 'package:tracking_app/shared/formz.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/toast.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/app_dialog.dart';
import 'package:tracking_app/shared/widgets/app_elevated_button.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';
import 'package:tracking_app/update_mood/cubit/update_mood_cubit.dart';

part 'widgets/update_mood_form.dart';

class UpdateMoodScreen extends StatelessWidget {
  const UpdateMoodScreen({
    required this.mood,
    super.key,
  });

  final Mood mood;

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
          subTitle: translations.deleteMoodMessage,
          confirmButtonText: translations.delete.toUpperCase(),
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdateMoodCubit(
            moodRepository: getIt.get<MoodRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => DeleteMoodCubit(
            moodRepository: getIt.get<MoodRepository>(),
          ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UpdateMoodCubit, FormzSubmissionStatus>(
            listenWhen: (previousUpdateMoodState, currentUpdateMoodState) =>
                previousUpdateMoodState != currentUpdateMoodState,
            listener: (context, state) {
              if (state.isSuccess) {
                showToast(
                  context,
                  Icons.done_rounded,
                  translations.moodUpdatedSuccessfully,
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
          ),
          BlocListener<DeleteMoodCubit, DeleteMoodState>(
            listenWhen: (previousDeleteMoodState, currentDeleteMoodState) =>
                previousDeleteMoodState != currentDeleteMoodState,
            listener: (context, deleteMoodState) {
              if (deleteMoodState.isSuccess) {
                showToast(
                  context,
                  Icons.delete_outline_rounded,
                  translations.moodDeletedSuccessfully,
                );

                context.go('/home');
              } else if (deleteMoodState.isError) {
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
            title: Column(
              children: [
                Text(
                  getDateString(context, mood.createdOn),
                  maxLines: 1,
                ),
                Text(
                  getTimeString(mood.createdOn),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: primarySwatch.shade400,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            centerTitle: true,
            actions: [
              BlocBuilder<DeleteMoodCubit, DeleteMoodState>(
                buildWhen: (previousDeleteMoodState, currentDeleteMoodState) =>
                    previousDeleteMoodState != currentDeleteMoodState,
                builder: (context, deleteMoodState) {
                  return deleteMoodState.maybeWhen(
                    loading: () => TinyLoadingIndicator(
                      color: primarySwatch.shade200,
                    ),
                    orElse: () => IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: primarySwatch.shade200,
                      ),
                      onPressed: () {
                        _showMoodDeletionDialog(
                          context,
                          () {
                            context.read<DeleteMoodCubit>().deleteMood(mood);
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          body: _UpdateMoodView(mood),
        ),
      ),
    );
  }
}

class _UpdateMoodView extends StatelessWidget {
  const _UpdateMoodView(this.mood);

  final Mood mood;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: _UpdateMoodForm(
        key: const Key('Update mood form'),
        mood: mood,
      ),
    );
  }
}
