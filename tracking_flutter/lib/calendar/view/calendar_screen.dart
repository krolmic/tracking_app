import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/calendar/cubit/calendar_cubit.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/date_time.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/toast.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/shared/widgets/mood_tile.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return BlocProvider<CalendarCubit>(
      create: (context) => CalendarCubit(
        moodRepository: getIt.get<MoodRepository>(),
        userProfileRepository: getIt.get<UserProfileRepository>(),
      )..init(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<CalendarCubit, CalendarState>(
            listenWhen: (previous, current) =>
                previous.targetDate != current.targetDate,
            listener: (context, state) {
              context.read<CalendarCubit>().loadMoodsInMonth();
            },
          ),
          BlocListener<CalendarCubit, CalendarState>(
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
        child: BlocBuilder<CalendarCubit, CalendarState>(
          buildWhen: (previous, current) =>
              previous.moodsState != current.moodsState,
          builder: (context, state) {
            final markedDates = EventList<Event>(
              events: state.moodsState.moods
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

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: viewPaddingHorizontal,
                  ),
                  child: CalendarCarousel<Event>(
                    height: 380,
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
                    markedDatesMap: markedDates,
                    targetDateTime:
                        state.targetDate.isSet ? state.targetDate.date : null,
                    onCalendarChanged:
                        context.read<CalendarCubit>().setTargetDate,
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: viewPaddingHorizontal),
                        for (final mood in state.moodsState.moods)
                          Padding(
                            key: ValueKey(mood),
                            padding: const EdgeInsets.only(
                              bottom: verticalPaddingMedium,
                            ),
                            child: GestureDetector(
                              onTap: () =>
                                  context.go('/calendar/update', extra: mood),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  width: 100,
                                  height: 125,
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: primarySwatch.shade200,
                                        child: Center(
                                          child: MoodEmoji(
                                            moodValue: mood.value,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        getDateString(
                                          context,
                                          mood.createdOn,
                                          includeYear: false,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: tileTitleColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(width: viewPaddingHorizontal),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
