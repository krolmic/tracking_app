part of '../home_screen.dart';

class _HomeMoods extends StatelessWidget {
  const _HomeMoods({required this.moods});

  final List<Mood> moods;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final mood in moods)
          TrackedMood(
            mood: mood,
            onTap: () => context.pushNamed(
              RoutesNames.updateMoodFromHome,
              extra: UpdateMoodRouteParameters(mood: mood),
            ),
          ).animate().fadeIn(
                duration: animationDuration,
              ),
        const VerticalSpacing.medium(),
      ],
    );
  }
}
