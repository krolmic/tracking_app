import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/app_settings/bloc/app_settings_bloc.dart';
import 'package:tracking_app/create_mood/bloc/create_mood_bloc.dart';
import 'package:tracking_app/delete_mood/cubit/delete_mood_cubit.dart';
import 'package:tracking_app/home/cubit/home_cubit.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/currencies.dart';
import 'package:tracking_app/shared/extensions/date_time.dart';
import 'package:tracking_app/shared/extensions/double.dart';
import 'package:tracking_app/shared/extensions/duration.dart';
import 'package:tracking_app/shared/router/routes_names.dart';
import 'package:tracking_app/shared/router/routes_parameters.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/app_elevated_button.dart';
import 'package:tracking_app/shared/widgets/error_message.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/shared/widgets/mood_data.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';
import 'package:tracking_app/shared/widgets/tracked_mood.dart';
import 'package:tracking_app/update_mood/bloc/update_mood_bloc.dart';
import 'package:tracking_app/user_profile/cubit/user_profile_cubit.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

part 'widgets/home_moods.dart';
part 'widgets/home_moods_header.dart';
part 'widgets/home_progress.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return BlocProvider<HomeCubit>(
      create: (context) {
        final userProfileCubit = context.read<UserProfileCubit>();
        if (!userProfileCubit.state.isSuccess) {
          userProfileCubit.loadUserProfile();
        }

        return HomeCubit(
          moodRepository: getIt.get<MoodRepository>(),
          userProfileRepository: getIt.get<UserProfileRepository>(),
        )..init();
      },
      child: Scaffold(
        floatingActionButton: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previousState, currentState) =>
              previousState != currentState,
          builder: (context, state) {
            final showAddButton =
                state.isSuccess && !state.moodsListState.containsTodayMood;

            if (showAddButton) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: viewPaddingHorizontal,
                ),
                child: AppElevatedButton(
                  icon: Iconsax.add_outline,
                  label: translations.trackToday,
                  onPressed: () {
                    context.pushNamed(
                      RoutesNames.createMoodFromHome,
                      extra: CreateMoodRouteParameters(date: DateTime.now()),
                    );
                  },
                  isLoading: state.isInitialOrLoading,
                ),
              ).animate().moveY(
                    curve: Curves.easeOut,
                    begin: 200,
                    end: 0,
                    duration: animationDuration,
                    delay: animationDuration * 2,
                  );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: const _HomeView(),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CreateMoodBloc, CreateMoodState>(
          listenWhen: (previousCreateMoodState, currentCreateMoodState) =>
              previousCreateMoodState.formStatus !=
              currentCreateMoodState.formStatus,
          listener: (context, state) {
            if (state.formStatus.isSuccess) {
              context.read<HomeCubit>().init();
            }
          },
        ),
        BlocListener<UpdateMoodBloc, UpdateMoodState>(
          listenWhen: (previousUpdateMoodState, currentUpdateMoodState) =>
              previousUpdateMoodState.formStatus !=
              currentUpdateMoodState.formStatus,
          listener: (context, state) {
            if (state.formStatus.isSuccess) {
              context.read<HomeCubit>().init();
            }
          },
        ),
        BlocListener<DeleteMoodCubit, DeleteMoodState>(
          listenWhen: (previousDeleteMoodState, currentDeleteMoodState) =>
              previousDeleteMoodState != currentDeleteMoodState,
          listener: (context, deleteMoodState) {
            if (deleteMoodState.isSuccess) {
              context.read<HomeCubit>().init();
            }
          },
        ),
      ],
      child: Builder(
        builder: (context) {
          final userProfileState = context.watch<UserProfileCubit>().state;
          final homeState = context.watch<HomeCubit>().state;

          if (userProfileState.isInitialOrLoading ||
              homeState.isInitialOrLoading) {
            return const BaseView(child: Center(child: LoadingIndicator()));
          } else if (userProfileState.isError || homeState.isError) {
            return BaseView(
              child: ErrorMessage(
                onRefresh: () {
                  if (userProfileState.isError) {
                    context.read<UserProfileCubit>().loadUserProfile();
                  }

                  if (homeState.isError) {
                    context.read<HomeCubit>().init();
                  }
                },
              ),
            );
          }

          final moodsState = homeState.moodsListState;

          return BaseView(
            child: _HomeContentView(
              firstName: userProfileState.firstName,
              weeklyProgress: moodsState.weeklyProgress,
              averageWorkTime: moodsState.averageWorkTimeThisWeek,
              averageRevenue: moodsState.averageRevenueThisWeek,
              averageMood: moodsState.averageMoodThisWeek,
              moods: moodsState.recentlyAddedMoods,
              trackedEveryDay: moodsState.trackedEveryDayThisWeek,
              trackedToday: moodsState.containsTodayMood,
            ),
          );
        },
      ),
    );
  }
}

class _HomeContentView extends StatelessWidget {
  const _HomeContentView({
    required this.firstName,
    required this.moods,
    required this.weeklyProgress,
    required this.averageWorkTime,
    required this.averageMood,
    required this.averageRevenue,
    required this.trackedEveryDay,
    required this.trackedToday,
  });

  final String firstName;
  final double weeklyProgress;
  final List<Mood> moods;
  final double? averageMood;
  final Duration? averageWorkTime;
  final double? averageRevenue;
  final bool trackedEveryDay;
  final bool trackedToday;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;
    final addExtraBottomSpace = moods.length > 2 && !trackedToday;

    final averageMoodValue =
        averageMood != null ? averageMood!.toFormattedString() : '-';
    final averageWorkTimeValue =
        averageWorkTime != null ? averageWorkTime!.toFormattedString() : '-';

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacing.large(),
          Text(
            DateTime.now().getGreetingString(translations),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            firstName,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const VerticalSpacing.large(),
          Text(
            translations.weekProgress,
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 3,
          ),
          const VerticalSpacing.large(),
          _HomeProgress(
            weeklyProgress: weeklyProgress,
            trackedEveryDayThisWeek: trackedEveryDay,
            trackedToday: trackedToday,
          ),
          const VerticalSpacing.medium(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MoodData(
                    icon: Iconsax.heart_bold,
                    label: translations.averageMood,
                    value: averageMoodValue,
                  ).animate().fadeIn(
                        duration: animationDuration,
                      ),
                ),
                const HorizontalSpacing.medium(),
                Expanded(
                  child: MoodData(
                    icon: Iconsax.timer_bold,
                    label: translations.averageWorkHours,
                    value: averageWorkTimeValue,
                  ).animate().fadeIn(
                        duration: animationDuration,
                        delay: animationDuration,
                      ),
                ),
                const HorizontalSpacing.medium(),
                Expanded(
                  child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
                    buildWhen: (previous, current) =>
                        previous.appSettingsData.currency !=
                        current.appSettingsData.currency,
                    builder: (context, state) {
                      final currency =
                          getCurrencySymbol(state.appSettingsData.currency);

                      final averageRevenueValue = averageRevenue != null
                          ? '${averageRevenue!.toFormattedString()} $currency'
                          : '-';

                      return MoodData(
                        icon: Iconsax.money_4_bold,
                        label: translations.averageRevenue,
                        value: averageRevenueValue,
                      );
                    },
                  ).animate().fadeIn(
                        duration: animationDuration,
                        delay: animationDuration * 2,
                      ),
                ),
              ],
            ),
          ),
          const VerticalSpacing.large(),
          if (moods.isNotEmpty) const _HomeMoodsHeader(),
          _HomeMoods(moods: moods),
          if (addExtraBottomSpace) const VerticalSpacing.extraLarge(),
        ],
      ),
    );
  }
}
