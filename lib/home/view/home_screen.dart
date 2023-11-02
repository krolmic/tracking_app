import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/home/cubit/home_cubit.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/constants/colors.dart';
import 'package:tracking_app/shared/constants/layout.dart';
import 'package:tracking_app/shared/helper/mood_value_color.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/error_message.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/user_profile/cubit/user_profile_cubit.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

part 'widgets/mood_card.dart';
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
          dataStore: getIt.get<DataStoreCategory>(),
          userProfileRepository: getIt.get<UserProfileRepository>(),
        )..init();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: viewPaddingHorizontal,
          ),
          child: Hero(
            tag: 'track-button',
            child: ElevatedButton.icon(
              onPressed: () {
                safePrint('navigate to create mood screen');
                context.go('/home/create');
              },
              icon: const Icon(Icons.add),
              label: const Text("Track today's mood"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
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
    final translations = AppLocalizations.of(context)!;

    safePrint(translations.hello("firstName"));

    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, userProfileState) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, homeState) {
            return BaseView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Builder(
                  builder: (context) {
                    if (userProfileState.isInitialOrLoading ||
                        homeState.isInitialOrLoading) {
                      return const LoadingIndicator();
                    } else if (userProfileState.isError || homeState.isError) {
                      return ErrorMessage(
                        onRefresh: () {
                          if (userProfileState.isError) {
                            context.read<UserProfileCubit>().loadUserProfile();
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
    if (widget.moods.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Hello ${widget.firstName}!',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: verticalPaddingSmall,
          ),
          Center(
            child: Text(
              'Use the button below to track your mood.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    final mediaQuery = MediaQuery.of(context);
    final screenPadding = mediaQuery.padding;
    final moodsListViewHeight =
        (mediaQuery.size.height - screenPadding.top - screenPadding.bottom) / 2;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello ${widget.firstName}!',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: verticalPaddingMedium,
          ),
          Text(
            'Your mood history',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            'Tap on an element to see your diary and things you are greatful '
            'for.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: verticalPaddingLarge,
          ),
          SizedBox(
            height: moodsListViewHeight,
            child: _MoodsShaderMask(
              child: _buildMoodsListView(),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  ListView _buildMoodsListView() {
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
            child: LoadingIndicator(),
          );
        }

        final mood = widget.moods[index];

        return Padding(
          key: ValueKey(mood),
          padding: const EdgeInsets.only(
            bottom: verticalPaddingMedium,
          ),
          child: _MoodCard(mood: mood),
        );
      },
    );
  }
}
