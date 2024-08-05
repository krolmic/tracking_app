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
import 'package:tracking_app/main.dart';
import 'package:tracking_app/moods/cubit/moods_cubit.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/app_elevated_button.dart';
import 'package:tracking_app/shared/widgets/error_message.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/shared/widgets/tracked_mood.dart';
import 'package:tracking_app/update_mood/bloc/update_mood_bloc.dart';
import 'package:tracking_app/user_profile/cubit/user_profile_cubit.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

part 'widgets/moods_shader_mask.dart';

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
        appBar: AppBar(
          title: Text(
            translations.moodHistoryTitle,
          ),
        ),
        extendBodyBehindAppBar: true,
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
                icon: todaysMoodIsTracked ? Icons.edit : Iconsax.add_outline,
                label: todaysMoodIsTracked
                    ? translations.updateToday
                    : translations.trackToday,
                onPressed: () {
                  if (todaysMoodIsTracked) {
                    context.goNamed(
                      'update-mood-from-home',
                      extra: state.moodsListState.todaysMood,
                    );
                  } else {
                    context.goNamed('create-mood-from-moods');
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
      child: BlocBuilder<MoodsCubit, MoodsState>(
        buildWhen: (previousState, currentState) =>
            previousState != currentState,
        builder: (context, state) {
          return BaseView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Builder(
                builder: (context) {
                  if (state.isInitialOrLoading) {
                    return const Center(child: LoadingIndicator());
                  } else if (state.isError) {
                    return ErrorMessage(
                      onRefresh: () {
                        if (state.isError) {
                          context.read<MoodsCubit>().init();
                        }
                      },
                    );
                  }

                  final moodsSuccessState =
                      state.moodsListState as MoodsListSuccessState;

                  return _MoodsContentView(
                    moods: moodsSuccessState.moods,
                    hasReachedMaxMoods: moodsSuccessState.hasReachedMax,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MoodsContentView extends StatefulWidget {
  const _MoodsContentView({
    required this.moods,
    required this.hasReachedMaxMoods,
  });

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

        return TrackedMood(
          key: ValueKey(mood),
          mood: mood,
          onTap: () => context.goNamed(
            'update-mood-from-moods',
            extra: mood,
          ),
        ).animate().fadeIn(duration: animationDuration);
      },
    );
  }
}
