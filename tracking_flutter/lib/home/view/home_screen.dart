import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/create_mood/cubit/create_mood_cubit.dart';
import 'package:tracking_app/delete_mood/cubit/delete_mood_cubit.dart';
import 'package:tracking_app/home/cubit/home_cubit.dart';
import 'package:tracking_app/main.dart';
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
import 'package:tracking_app/update_mood/cubit/update_mood_cubit.dart';
import 'package:tracking_app/user_profile/cubit/user_profile_cubit.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

part 'widgets/mood_tile.dart';
part 'widgets/moods_shader_mask.dart';

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
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: viewPaddingHorizontal,
          ),
          child: AppElevatedButton(
            icon: Icons.add,
            label: AppLocalizations.of(context)!.trackMood,
            onPressed: () {
              context.go('/home/create');
            },
            isLoading: false,
          ),
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
        BlocListener<CreateMoodCubit, FormzSubmissionStatus>(
          listenWhen: (previousCreateMoodState, currentCreateMoodState) =>
              previousCreateMoodState != currentCreateMoodState,
          listener: (context, state) {
            if (state.isSuccess) {
              context.read<HomeCubit>().loadMoods(reloadMoods: true);
            }
          },
        ),
        BlocListener<UpdateMoodCubit, FormzSubmissionStatus>(
          listenWhen: (previousUpdateMoodState, currentUpdateMoodState) =>
              previousUpdateMoodState != currentUpdateMoodState,
          listener: (context, state) {
            if (state.isSuccess) {
              context.read<HomeCubit>().loadMoods(reloadMoods: true);
            }
          },
        ),
        BlocListener<DeleteMoodCubit, DeleteMoodState>(
          listenWhen: (previousDeleteMoodState, currentDeleteMoodState) =>
              previousDeleteMoodState != currentDeleteMoodState,
          listener: (context, deleteMoodState) {
            if (deleteMoodState.isSuccess) {
              context.read<HomeCubit>().loadMoods(reloadMoods: true);
            }
          },
        ),
      ],
      child: BlocBuilder<UserProfileCubit, UserProfileState>(
        buildWhen: (previousUserProfileState, currentUserProfileState) =>
            previousUserProfileState != currentUserProfileState,
        builder: (context, userProfileState) {
          return BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previousHomeState, currentHomeState) =>
                previousHomeState != currentHomeState,
            builder: (context, homeState) {
              return BaseView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Builder(
                    builder: (context) {
                      if (userProfileState.isInitialOrLoading ||
                          homeState.isInitialOrLoading) {
                        return const Center(child: LoadingIndicator());
                      } else if (userProfileState.isError ||
                          homeState.isError) {
                        return ErrorMessage(
                          onRefresh: () {
                            if (userProfileState.isError) {
                              context
                                  .read<UserProfileCubit>()
                                  .loadUserProfile();
                            }

                            if (homeState.isError) {
                              context.read<HomeCubit>().init();
                            }
                          },
                        );
                      }

                      final moodsSuccessState =
                          homeState.moodsState as HomeMoodsSuccessState;
                      final userProfileSuccessState =
                          userProfileState as UserProfileSuccessState;

                      return _HomeContentView(
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

class _HomeContentView extends StatefulWidget {
  const _HomeContentView({
    required this.firstName,
    required this.moods,
    required this.hasReachedMaxMoods,
  });

  final String firstName;
  final List<Mood> moods;
  final bool hasReachedMaxMoods;

  @override
  State<_HomeContentView> createState() => _HomeContentViewState();
}

class _HomeContentViewState extends State<_HomeContentView> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 50.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  /// Calls [HomeCubit.loadMoods] if the current scroll position in pixels
  /// substracted from maximal scroll position
  /// is less or equal than [_scrollThreshold].
  Future<void> _onScroll() async {
    final maxScrollPosition = _scrollController.position.maxScrollExtent;
    final currentScrollPosition = _scrollController.position.pixels;

    if (maxScrollPosition - currentScrollPosition <= _scrollThreshold) {
      await context.read<HomeCubit>().loadMoods();
    }
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    if (widget.moods.isEmpty) {
      return _HomeContentWithNoMoods(
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
            bottom: verticalPaddingMedium,
          ),
          child: _MoodTile(mood: mood),
        );
      },
    );
  }
}

class _HomeContentWithNoMoods extends StatelessWidget {
  const _HomeContentWithNoMoods({
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
