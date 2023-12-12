import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/delete_mood/cubit/delete_mood_cubit.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/constants/colors.dart';
import 'package:tracking_app/shared/constants/layout.dart';
import 'package:tracking_app/shared/formz.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/app_elevated_button.dart';
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

        return AlertDialog(
          title: Text(translations.deleteMood),
          content: Text(translations.deleteMoodMessage),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: Navigator.of(context).pop,
              child: Text(translations.cancel.toUpperCase()),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
              child: Text(translations.delete.toUpperCase()),
            ),
          ],
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
                _showSuccessMessage(
                    translations.moodUpdatedSuccessfully, context);

                context.go('/home');
              } else if (state.isFailure) {
                _showErrorMessage(context);
              }
            },
          ),
          BlocListener<DeleteMoodCubit, DeleteMoodState>(
            listenWhen: (previousDeleteMoodState, currentDeleteMoodState) =>
                previousDeleteMoodState != currentDeleteMoodState,
            listener: (context, deleteMoodState) {
              if (deleteMoodState.isSuccess) {
                _showSuccessMessage(
                    translations.moodDeletedSuccessfully, context);

                context.go('/home');
              } else if (deleteMoodState.isError) {
                _showErrorMessage(context);
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                Text(
                  Jiffy.parseFromDateTime(mood.createdOn).yMMMMd,
                  maxLines: 1,
                ),
                Text(
                  Jiffy.parseFromDateTime(mood.createdOn).jm,
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
                    loading: () => SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: primarySwatch.shade300,
                      ),
                    ),
                    orElse: () => IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: primarySwatch.shade300,
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

  void _showSuccessMessage(String text, BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            '$text 🎉',
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
