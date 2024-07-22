import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/calendar/bloc/calendar_bloc.dart';
import 'package:tracking_app/calendar/view/widgets/tracked_mood.dart';
import 'package:tracking_app/create_mood/bloc/create_mood_bloc.dart';
import 'package:tracking_app/delete_mood/cubit/delete_mood_cubit.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/date_time.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/toast.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';
import 'package:tracking_app/update_mood/bloc/update_mood_bloc.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

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
                  context,
                  Icons.error_rounded,
                  translations.somethingWentWrong,
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
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              translations.calendar,
            ),
            centerTitle: true,
          ),
          body: const _CalendarView(),
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: viewPaddingHorizontal,
                  ),
                  child: CalendarCarousel<Event>(
                    firstDayOfWeek: (0 + 1) % 7,
                    height: 380,
                    todayButtonColor: primarySwatch.shade500,
                    prevDaysTextStyle: TextStyle(
                      color: primarySwatch.shade100,
                    ),
                    weekendTextStyle: TextStyle(
                      color: primarySwatch.shade600,
                    ),
                    nextDaysTextStyle: TextStyle(
                      color: primarySwatch.shade100,
                    ),
                    headerTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    rightButtonIcon: const Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                    ),
                    leftButtonIcon: const Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                    weekdayTextStyle: TextStyle(
                      color: primarySwatch.shade800,
                    ),
                    markedDatesMap: getMarkedDates(state.moodsState.moods),
                    targetDateTime:
                        state.targetDate.isSet ? state.targetDate.date : null,
                    onCalendarChanged: (date) => context
                        .read<CalendarBloc>()
                        .add(CalendarEvent.targetDateChanged(date: date)),
                    onDayPressed: (date, events) {
                      if (events.isNotEmpty) {
                        final mood =
                            context.read<CalendarBloc>().getMoodForDate(date);
                        if (mood != null) {
                          context.go('/calendar/update', extra: mood);
                        }
                      }
                    },
                    locale: Localizations.localeOf(context).languageCode,
                  ),
                ),
                const VerticalSpacing.medium(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: viewPaddingHorizontal,
                  ),
                  child: Text(
                    translations.trackedMood,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const VerticalSpacing.medium(),
                if (state.moodsState.isLoading || state.moodsState.isInitial)
                  const SizedBox(
                    height: 125,
                    child: Center(child: LoadingIndicator()),
                  )
                else if (state.moodsState.isSuccess &&
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
                else if (state.moodsState.isSuccess)
                  _MoodsInMonth(moods: state.moodsState.moods),
              ],
            );
          },
        ),
      ),
    );
  }

  EventList<Event> getMarkedDates(List<Mood> moods) {
    return EventList<Event>(
      events: moods
          .map(
        (mood) => <DateTime, List<Event>>{
          mood.createdOn.dateOnly: [
            Event(
              date: mood.createdOn.dateOnly,
              dot: Container(
                margin: const EdgeInsets.symmetric(horizontal: 1),
                color: primarySwatch.shade500,
                height: 5,
                width: 5,
              ),
            ),
          ],
        },
      )
          .fold(
        <DateTime, List<Event>>{},
        (map, event) {
          map.addAll(event);
          return map;
        },
      ),
    );
  }
}

class _MoodsInMonth extends StatelessWidget {
  const _MoodsInMonth({
    required this.moods,
  });

  final List<Mood> moods;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: viewPaddingHorizontal),
          for (final mood in moods)
            Padding(
              key: ValueKey(mood),
              padding: const EdgeInsets.only(
                right: verticalPaddingSmall,
              ),
              child: TrackedMood(mood: mood),
            ),
          const SizedBox(width: viewPaddingHorizontal),
        ],
      ),
    );
  }
}
