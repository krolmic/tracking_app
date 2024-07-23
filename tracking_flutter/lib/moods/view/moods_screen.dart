import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/create_mood/bloc/create_mood_bloc.dart';
import 'package:tracking_app/delete_mood/cubit/delete_mood_cubit.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/moods/cubit/moods_cubit.dart';
import 'package:tracking_app/shared/date_time.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/app_elevated_button.dart';
import 'package:tracking_app/shared/widgets/error_message.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/shared/widgets/mood_emoji.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';
import 'package:tracking_app/shared/widgets/tile.dart';
import 'package:tracking_app/update_mood/bloc/update_mood_bloc.dart';
import 'package:tracking_app/user_profile/cubit/user_profile_cubit.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

part 'widgets/moods_shader_mask.dart';
part 'widgets/tracked_mood.dart';

class MoodsScreen extends StatelessWidget {
  const MoodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return BlocProvider<MoodsCubit>(
      create: (context) {
        final userProfileCubit = context.read<UserProfileCubit>();
        if (!userProfileCubit.state.isSuccess) {
          userProfileCubit.loadUserProfile();
        }

        return MoodsCubit(
          moodRepository: getIt.get<MoodRepository>(),
          userProfileRepository: getIt.get<UserProfileRepository>(),
        )..init();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: viewPaddingHorizontal,
          ),
          child: BlocBuilder<MoodsCubit, MoodsState>(
            buildWhen: (previousState, currentState) =>
                previousState != currentState,
            builder: (context, state) {
              if (state.isError) {
                return const SizedBox.shrink();
              }

              final todaysMoodIsTracked =
                  state.moodsListState.containsTodayMood;

              return AppElevatedButton(
                icon: todaysMoodIsTracked ? Icons.edit : Icons.add,
                label: todaysMoodIsTracked
                    ? translations.updateMood
                    : translations.trackMood,
                onPressed: () {
                  if (todaysMoodIsTracked) {
                    context.go(
                      '/home/update',
                      extra: state.moodsListState.todaysMood,
                    );
                  } else {
                    context.go('/home/create');
                  }
                },
                isLoading: state.isInitialOrLoading,
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: const _MoodsView(),
      ),
    );
  }
}

class _MoodsView extends StatelessWidget {
  const _MoodsView();

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
              context.read<MoodsCubit>().loadMoods(reloadMoods: true);
            }
          },
        ),
        BlocListener<UpdateMoodBloc, UpdateMoodState>(
          listenWhen: (previousUpdateMoodState, currentUpdateMoodState) =>
              previousUpdateMoodState.formStatus !=
              currentUpdateMoodState.formStatus,
          listener: (context, state) {
            if (state.formStatus.isSuccess) {
              context.read<MoodsCubit>().loadMoods(reloadMoods: true);
            }
          },
        ),
        BlocListener<DeleteMoodCubit, DeleteMoodState>(
          listenWhen: (previousDeleteMoodState, currentDeleteMoodState) =>
              previousDeleteMoodState != currentDeleteMoodState,
          listener: (context, deleteMoodState) {
            if (deleteMoodState.isSuccess) {
              context.read<MoodsCubit>().loadMoods(reloadMoods: true);
            }
          },
        ),
      ],
      child: BlocBuilder<UserProfileCubit, UserProfileState>(
        buildWhen: (previousUserProfileState, currentUserProfileState) =>
            previousUserProfileState != currentUserProfileState,
        builder: (context, userProfileState) {
          return BlocBuilder<MoodsCubit, MoodsState>(
            buildWhen: (previousState, currentState) =>
                previousState != currentState,
            builder: (context, state) {
              return BaseView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Builder(
                    builder: (context) {
                      if (userProfileState.isInitialOrLoading ||
                          state.isInitialOrLoading) {
                        return const Center(child: LoadingIndicator());
                      } else if (userProfileState.isError || state.isError) {
                        return ErrorMessage(
                          onRefresh: () {
                            if (userProfileState.isError) {
                              context
                                  .read<UserProfileCubit>()
                                  .loadUserProfile();
                            }

                            if (state.isError) {
                              context.read<MoodsCubit>().init();
                            }
                          },
                        );
                      }

                      final moodsSuccessState =
                          state.moodsListState as MoodsListSuccessState;
                      final userProfileSuccessState =
                          userProfileState as UserProfileSuccessState;

                      return _MoodsContentView(
                        firstName: userProfileSuccessState.firstName,
                        moods: moodsSuccessState.moods,
                        hasReachedMaxMoods: moodsSuccessState.hasReachedMax,
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _MoodsContentView extends StatefulWidget {
  const _MoodsContentView({
    required this.firstName,
    required this.moods,
    required this.hasReachedMaxMoods,
  });

  final String firstName;
  final List<Mood> moods;
  final bool hasReachedMaxMoods;

  @override
  State<_MoodsContentView> createState() => _MoodsContentViewState();
}

class _MoodsContentViewState extends State<_MoodsContentView> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 50.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  /// Calls [MoodsCubit.loadMoods] if the current scroll position in pixels
  /// substracted from maximal scroll position
  /// is less or equal than [_scrollThreshold].
  Future<void> _onScroll() async {
    final maxScrollPosition = _scrollController.position.maxScrollExtent;
    final currentScrollPosition = _scrollController.position.pixels;

    if (maxScrollPosition - currentScrollPosition <= _scrollThreshold) {
      await context.read<MoodsCubit>().loadMoods();
    }
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    if (widget.moods.isEmpty) {
      return _MoodsContentWithNoMoods(
        firstName: widget.firstName,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpacing.large(),
        Text(
          getGreetingString(context, DateTime.now(), widget.firstName),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const VerticalSpacing.medium(),
        Text(
          translations.moodHistoryTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const VerticalSpacing.medium(),
        Text(
          translations.moodHistoryDescription,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const VerticalSpacing.large(),
        Expanded(
          child: MoodsShaderMask(
            child: _buildMoods(),
          ),
        ),
      ],
    );
  }

  ListView _buildMoods() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.hasReachedMaxMoods
          ? widget.moods.length
          : widget.moods.length + 1,
      itemBuilder: (context, index) {
        if (index >= widget.moods.length) {
          return const Padding(
            padding: EdgeInsets.only(
              top: verticalPaddingMedium,
            ),
            child: Center(child: LoadingIndicator()),
          );
        }

        final mood = widget.moods[index];

        return Padding(
          key: ValueKey(mood),
          padding: const EdgeInsets.only(
            bottom: verticalPaddingSmall,
          ),
          child: _TrackedMood(mood: mood),
        );
      },
    );
  }
}

class _MoodsContentWithNoMoods extends StatelessWidget {
  const _MoodsContentWithNoMoods({
    required this.firstName,
  });

  final String firstName;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AnimatedEmoji(
          AnimatedEmojis.warmSmile,
          size: 128,
        ),
        const VerticalSpacing.small(),
        Center(
          child: Text(
            getGreetingString(context, DateTime.now(), firstName),
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const VerticalSpacing.small(),
        Center(
          child: Text(
            translations.noMoodsYet,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
