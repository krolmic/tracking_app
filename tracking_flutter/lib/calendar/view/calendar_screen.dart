import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tracking_app/calendar/bloc/calendar_bloc.dart';
import 'package:tracking_app/create_mood/bloc/create_mood_bloc.dart';
import 'package:tracking_app/delete_mood/cubit/delete_mood_cubit.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/extensions/date_time.dart';
import 'package:tracking_app/shared/iap/revenue_cat_ui_helper.dart';
import 'package:tracking_app/shared/router/routes_names.dart';
import 'package:tracking_app/shared/router/routes_parameters.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/toast.dart';
import 'package:tracking_app/shared/widgets/mood_emoji.dart';
import 'package:tracking_app/shared/widgets/moods_shader_mask.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';
import 'package:tracking_app/update_mood/bloc/update_mood_bloc.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

part 'widgets/calendar.dart';
part 'widgets/moods_in_month.dart';
part 'widgets/tracked_mood.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return BlocProvider<CalendarBloc>(
      create: (context) => CalendarBloc(
        moodRepository: getIt.get<MoodRepository>(),
        userProfileRepository: getIt.get<UserProfileRepository>(),
      )..add(const CalendarEvent.calendarInitialized()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<CalendarBloc, CalendarState>(
            listenWhen: (previousState, currentState) =>
                previousState.moodsState != currentState.moodsState,
            listener: (context, calendarState) {
              if (calendarState.moodsState.isError) {
                showToast(
                  context: context,
                  message: translations.somethingWentWrong,
                  isError: true,
                );
              }
            },
          ),
          BlocListener<CreateMoodBloc, CreateMoodState>(
            listenWhen: (previousCreateMoodState, currentCreateMoodState) =>
                previousCreateMoodState.formStatus !=
                currentCreateMoodState.formStatus,
            listener: (context, state) {
              if (state.formStatus.isSuccess) {
                context
                    .read<CalendarBloc>()
                    .add(const CalendarEvent.moodsUpdated());
              }
            },
          ),
          BlocListener<UpdateMoodBloc, UpdateMoodState>(
            listenWhen: (previousUpdateMoodState, currentUpdateMoodState) =>
                previousUpdateMoodState.formStatus !=
                currentUpdateMoodState.formStatus,
            listener: (context, updateMoodState) {
              if (updateMoodState.formStatus.isSuccess) {
                context
                    .read<CalendarBloc>()
                    .add(const CalendarEvent.moodsUpdated());
              }
            },
          ),
          BlocListener<DeleteMoodCubit, DeleteMoodState>(
            listenWhen: (previousDeleteMoodState, currentDeleteMoodState) =>
                previousDeleteMoodState != currentDeleteMoodState,
            listener: (context, deleteMoodState) {
              if (deleteMoodState.isSuccess) {
                context
                    .read<CalendarBloc>()
                    .add(const CalendarEvent.moodsUpdated());
              }
            },
          ),
        ],
        child: const Scaffold(
          body: _CalendarView(),
        ),
      ),
    );
  }
}

class _CalendarView extends StatelessWidget {
  const _CalendarView();

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return SafeArea(
      child: SingleChildScrollView(
        child: BlocBuilder<CalendarBloc, CalendarState>(
          buildWhen: (previous, current) =>
              previous.moodsState != current.moodsState,
          builder: (context, state) {
            return Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: maxViewWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalSpacing.large(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: viewPaddingHorizontal,
                        ),
                        child: _Calendar(
                          targetMonthDate: state.targetDate.date.startOfMonth,
                          moods: state.moodsState.moods,
                        ),
                      ),
                    ),
                    const VerticalSpacing.small(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: viewPaddingHorizontal,
                      ),
                      child: Text(
                        translations.trackedMood,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    const VerticalSpacing.large(),
                    if (state.moodsState.isSuccess &&
                        state.moodsState.moods.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: viewPaddingHorizontal,
                        ),
                        child: Text(
                          translations.noTrackedMood,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    else if (state.isInitialOrLoading || state.isSuccess)
                      _MoodsInMonth(
                        moods: state.moodsState.moods,
                        isLoading: state.isInitialOrLoading,
                      ).animate().fadeIn(duration: animationDuration),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
