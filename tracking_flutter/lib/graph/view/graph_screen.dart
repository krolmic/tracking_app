import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:graph_settings_repository/graph_settings_repository.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/app_settings/bloc/app_settings_bloc.dart';
import 'package:tracking_app/create_mood/bloc/create_mood_bloc.dart';
import 'package:tracking_app/delete_mood/cubit/delete_mood_cubit.dart';
import 'package:tracking_app/graph/bloc/graph_bloc.dart';
import 'package:tracking_app/graph/view/widgets/line_graph.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/currencies.dart';
import 'package:tracking_app/shared/extensions/date_time.dart';
import 'package:tracking_app/shared/extensions/duration.dart';
import 'package:tracking_app/shared/iap/revenue_cat_ui_helper.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/toast.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/app_dialog.dart';
import 'package:tracking_app/shared/widgets/drop_down.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/shared/widgets/mood_data.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';
import 'package:tracking_app/update_mood/bloc/update_mood_bloc.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

part 'widgets/graph_header.dart';
part 'widgets/graph_settings.dart';
part 'widgets/line_graph_explanation.dart';
part 'widgets/months_selection.dart';
part 'widgets/weeks_selection.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return BlocProvider<GraphBloc>(
      create: (context) => GraphBloc(
        moodRepository: getIt.get<MoodRepository>(),
        userProfileRepository: getIt.get<UserProfileRepository>(),
        graphSettingsRepository: getIt.get<GraphSettingsRepository>(),
      )..add(const GraphEvent.graphInitialized()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<GraphBloc, GraphState>(
            listenWhen: (previousState, currentState) =>
                previousState.moodsState != currentState.moodsState,
            listener: (context, state) {
              if (state.moodsState.isError) {
                showToast(
                  context: context,
                  message: translations.somethingWentWrong,
                  isError: true,
                );
              }
            },
          ),
          BlocListener<GraphBloc, GraphState>(
            listenWhen: (previousState, currentState) =>
                previousState.savingGraphSettingsState !=
                currentState.savingGraphSettingsState,
            listener: (context, state) {
              if (state.savingGraphSettingsState.isError) {
                showToast(
                  context: context,
                  message: translations.savingGraphSettingsFailed,
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
                context.read<GraphBloc>().add(const GraphEvent.moodsUpdated());
              }
            },
          ),
          BlocListener<UpdateMoodBloc, UpdateMoodState>(
            listenWhen: (previousUpdateMoodState, currentUpdateMoodState) =>
                previousUpdateMoodState.formStatus !=
                currentUpdateMoodState.formStatus,
            listener: (context, updateMoodState) {
              if (updateMoodState.formStatus.isSuccess) {
                context.read<GraphBloc>().add(const GraphEvent.moodsUpdated());
              }
            },
          ),
          BlocListener<DeleteMoodCubit, DeleteMoodState>(
            listenWhen: (previousDeleteMoodState, currentDeleteMoodState) =>
                previousDeleteMoodState != currentDeleteMoodState,
            listener: (context, deleteMoodState) {
              if (deleteMoodState.isSuccess) {
                context.read<GraphBloc>().add(const GraphEvent.moodsUpdated());
              }
            },
          ),
        ],
        child: const Scaffold(
          body: _GraphView(),
        ),
      ),
    );
  }
}

class _GraphView extends StatelessWidget {
  const _GraphView();

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;
    final dateTimeNow = DateTime.now();

    return BaseView(
      addHorizontalPadding: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpacing.large(),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: viewPaddingHorizontal + horizontalPaddingLarge,
              ),
              child: _GraphHeader(),
            ),
            const VerticalSpacing.medium(),
            BlocBuilder<GraphBloc, GraphState>(
              buildWhen: (previous, current) =>
                  previous.targetDate != current.targetDate ||
                  previous.settings.timeRangeMode !=
                      current.settings.timeRangeMode,
              builder: (context, state) {
                final setTargetDate = state.targetDate.date;

                if (state.settings.timeRangeMode.isMonthly) {
                  return _MonthsSelection(
                    currentMonth: dateTimeNow.month,
                    selectedMonth: setTargetDate.month,
                    disableMonths: setTargetDate.year == dateTimeNow.year,
                    currentYear: setTargetDate.year,
                    onMonthSelected: (month) {
                      context.read<GraphBloc>().add(
                            GraphEvent.targetDateChanged(
                              date: DateTime(setTargetDate.year, month),
                            ),
                          );
                    },
                  );
                } else {
                  return _WeeksSelection(
                    numberOfWeeks: setTargetDate.numberOfWeeksInYear,
                    currentWeek: dateTimeNow.weekNumber,
                    selectedWeek: setTargetDate.weekNumber,
                    disableWeeks: setTargetDate.year == dateTimeNow.year,
                    currentYear: setTargetDate.year,
                    onWeekSelected: (week) {
                      context.read<GraphBloc>().add(
                            GraphEvent.targetDateChanged(
                              date: DateTime(setTargetDate.year)
                                  .fromWeekNumber(week),
                            ),
                          );
                    },
                  );
                }
              },
            ),
            const VerticalSpacing.extraExtraLarge(),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: viewPaddingHorizontal),
              height: 300,
              child: Builder(
                builder: (context) {
                  final moodsState = context.select(
                    (GraphBloc graphBloc) => graphBloc.state.moodsState,
                  );
                  final settings = context.select(
                    (GraphBloc graphBloc) => graphBloc.state.settings,
                  );
                  final currency = context.select(
                    (AppSettingsBloc appSettingsBloc) =>
                        appSettingsBloc.state.appSettingsData.currency,
                  );

                  final targetDate =
                      context.read<GraphBloc>().state.targetDate.date;

                  return LineGraph(
                    targetDate: targetDate,
                    moods: moodsState.moods,
                    moodsWithTrackedRevenue: settings.showRevenue
                        ? moodsState.moodsWithTrackedRevenue
                        : [],
                    moodsWithTrackedWorkTime: settings.showWorkTime
                        ? moodsState.moodsWithTrackedWorkTime
                        : [],
                    currencySymbol: getCurrencySymbol(currency),
                    timeRangeMode: settings.timeRangeMode,
                  );
                },
              ),
            ).animate().fadeIn(duration: animationDuration),
            const VerticalSpacing.extraLarge(),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: viewPaddingHorizontal,
              ),
              child: _LineGraphExplanation(),
            ),
            const VerticalSpacing.extraLarge(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: viewPaddingHorizontal,
              ),
              child: BlocBuilder<GraphBloc, GraphState>(
                buildWhen: (previous, current) =>
                    previous.moodsState != current.moodsState,
                builder: (context, state) {
                  if (state.moodsState.isInitialOrLoading) {
                    return const Center(child: LoadingIndicator());
                  }
                  final moodsState = state.moodsState;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: horizontalPaddingLarge,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: MoodData(
                            icon: Iconsax.heart_bold,
                            label: translations.greatestMood,
                            value: moodsState.greatestMoodValue != null
                                ? moodsState.greatestMoodValue!.toString()
                                : '-',
                          ),
                        ),
                        const HorizontalSpacing.medium(),
                        Expanded(
                          child: MoodData(
                            icon: Iconsax.timer_bold,
                            label: translations.greatestWorkTime,
                            value: moodsState.greatestWorkTime != null
                                ? moodsState.greatestWorkTime!
                                    .toFormattedString()
                                : '-',
                          ),
                        ),
                        const HorizontalSpacing.medium(),
                        Expanded(
                          child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
                            buildWhen: (previous, current) =>
                                previous.appSettingsData.currency !=
                                current.appSettingsData.currency,
                            builder: (context, state) {
                              final currencySymbol = getCurrencySymbol(
                                state.appSettingsData.currency,
                              );
                              final greatestRevenue = moodsState
                                          .greatestRevenue !=
                                      null
                                  ? '${moodsState.greatestRevenue!.toInt()} '
                                      '$currencySymbol'
                                  : '-';

                              return MoodData(
                                icon: Iconsax.money_4_bold,
                                label: translations.greatestRevenue,
                                value: greatestRevenue,
                              );
                            },
                          ),
                        ),
                      ],
                    ).animate().fadeIn(duration: animationDuration),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
