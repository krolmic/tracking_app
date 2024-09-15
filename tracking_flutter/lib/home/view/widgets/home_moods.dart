part of '../home_screen.dart';

class _HomeMoods extends StatelessWidget {
  const _HomeMoods({required this.moods});

  final List<Mood> moods;

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 80,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final mood = moods[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: viewPaddingHorizontal,
            ),
            child: TrackedMood(
              mood: mood,
              onTap: () => context.pushNamed(
                RoutesNames.updateMoodFromHome,
                extra: UpdateMoodRouteParameters(mood: mood),
              ),
            )
                .animate()
                .fadeIn(
                  curve: Curves.easeIn,
                  duration: animationDuration,
                )
                .moveX(
                  duration: animationDuration,
                  curve: Curves.easeOut,
                  begin: index.isOdd ? 100 : -100,
                ),
          );
        },
        childCount: moods.length,
      ),
    );
  }
}
