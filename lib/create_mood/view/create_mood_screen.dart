import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/create_mood/cubit/create_mood_cubit.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/constants/colors.dart';
import 'package:tracking_app/shared/constants/layout.dart';
import 'package:tracking_app/shared/formz.dart';
import 'package:tracking_app/shared/helper/mood_value_color.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

part 'widgets/create_mood_form.dart';

class CreateMoodScreen extends StatelessWidget {
  const CreateMoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateMoodCubit(
        moodRepository: getIt.get<MoodRepository>(),
        userProfileRepository: getIt.get<UserProfileRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Track today's mood"),
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
    return const BaseView(
      child: SingleChildScrollView(
        child: _CreateMoodForm(
          key: ValueKey('Create mood form'),
        ),
      ),
    );
  }
}
