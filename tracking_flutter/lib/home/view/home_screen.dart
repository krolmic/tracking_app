import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/create_mood/bloc/create_mood_bloc.dart';
import 'package:tracking_app/delete_mood/cubit/delete_mood_cubit.dart';
import 'package:tracking_app/home/cubit/home_cubit.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/date_time.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/error_message.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/shared/widgets/mood_data.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';
import 'package:tracking_app/shared/widgets/tracked_mood.dart';
import 'package:tracking_app/update_mood/bloc/update_mood_bloc.dart';
import 'package:tracking_app/user_profile/cubit/user_profile_cubit.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

part 'widgets/progress.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: const Scaffold(
        body: _HomeView(),
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
      child: BlocBuilder<UserProfileCubit, UserProfileState>(
        buildWhen: (previousUserProfileState, currentUserProfileState) =>
            previousUserProfileState != currentUserProfileState,
        builder: (context, userProfileState) {
          return BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previousState, currentState) =>
                previousState != currentState,
            builder: (context, state) {
              return BaseView(
                child: Builder(
                  builder: (context) {
                    if (userProfileState.isInitialOrLoading ||
                        state.isInitialOrLoading) {
                      return const Center(child: LoadingIndicator());
                    } else if (userProfileState.isError || state.isError) {
                      return ErrorMessage(
                        onRefresh: () {
                          if (userProfileState.isError) {
                            context.read<UserProfileCubit>().loadUserProfile();
                          }

                          if (state.isError) {
                            context.read<HomeCubit>().init();
                          }
                        },
                      );
                    }

                    final userProfileSuccessState =
                        userProfileState as UserProfileSuccessState;

                    return _HomeContentView(
                      firstName: userProfileSuccessState.firstName,
                      weeklyProgress: state.moodsListState.weeklyProgress,
                      averageWorkTimeInHours:
                          state.moodsListState.averageWorkTimeInHoursThisWeek,
                      averageRevenue:
                          state.moodsListState.averageRevenueThisWeek,
                      averageMood: state.moodsListState.averageMoodThisWeek,
                      moods: state.moodsListState.recentlyAddedMoods,
                      trackedEveryDay:
                          state.moodsListState.trackedEveryDayThisWeek,
                      trackedToday: state.moodsListState.containsTodayMood,
                    );
                  },
                ),
              );
            },
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
    required this.averageWorkTimeInHours,
    required this.averageMood,
    required this.averageRevenue,
    required this.trackedEveryDay,
    required this.trackedToday,
  });

  final String firstName;
  final double weeklyProgress;
  final List<Mood> moods;
  final double averageMood;
  final int averageWorkTimeInHours;
  final int averageRevenue;
  final bool trackedEveryDay;
  final bool trackedToday;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacing.large(),
          Text(
            getGreetingString(context, DateTime.now()),
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
                    value: averageMood.toStringAsFixed(2),
                  ).animate().fadeIn(
                        duration: animationDuration,
                      ),
                ),
                const HorizontalSpacing.medium(),
                Expanded(
                  child: MoodData(
                    icon: Iconsax.timer_bold,
                    label: translations.averageWorkHours,
                    value: '$averageWorkTimeInHours h',
                  ).animate().fadeIn(
                        duration: animationDuration,
                        delay: animationDuration,
                      ),
                ),
                const HorizontalSpacing.medium(),
                Expanded(
                  child: MoodData(
                    icon: Iconsax.money_4_bold,
                    label: translations.averageRevenue,
                    value: averageRevenue.toString() + r' $',
                  ).animate().fadeIn(
                        duration: animationDuration,
                        delay: animationDuration * 2,
                      ),
                ),
              ],
            ),
          ),
          const VerticalSpacing.large(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translations.recentlyTracked,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(
                onPressed: () {
                  context.goNamed('moods');
                },
                child: Text(
                  translations.seeAll,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: blue,
                      ),
                ),
              ),
            ],
          ),
          for (final mood in moods)
            TrackedMood(
              mood: mood,
              onTap: () => context.goNamed(
                'update-mood-from-home',
                extra: mood,
              ),
            ).animate().fadeIn(
                  duration: animationDuration,
                ),
          const VerticalSpacing.extraLarge(),
        ],
      ),
    );
  }
}
