import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/constants/colors.dart';
import 'package:tracking_app/shared/constants/layout.dart';
import 'package:tracking_app/shared/formz.dart';
import 'package:tracking_app/shared/helper/mood_value_color.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/update_mood/cubit/update_mood_cubit.dart';

part 'widgets/update_mood_form.dart';

class UpdateMoodScreen extends StatelessWidget {
  const UpdateMoodScreen({
    required this.mood,
    super.key,
  });

  final Mood mood;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateMoodCubit(
        moodRepository: getIt.get<MoodRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Jiffy.parseFromDateTime(mood.createdOn).yMMMMd,
          ),
        ),
        body: _UpdateMoodView(mood),
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
      child: SingleChildScrollView(
        child: _UpdateMoodForm(
          key: const Key('Update mood form'),
          mood: mood,
        ),
      ),
    );
  }
}
