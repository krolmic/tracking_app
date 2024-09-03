part of '../calendar_screen.dart';

class _MoodsInMonth extends StatelessWidget {
  const _MoodsInMonth({
    required this.moods,
  });

  final List<Mood> moods;

  @override
  Widget build(BuildContext context) {
    return MoodsShaderMask(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: const [0.0, 0.9, 1.0],
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: viewPaddingHorizontal),
            for (final mood in moods)
              Padding(
                key: ValueKey(mood),
                padding: const EdgeInsets.only(
                  right: verticalPaddingSmall,
                ),
                child: _TrackedMood(mood: mood),
              ),
            const SizedBox(width: viewPaddingHorizontal),
          ],
        ),
      ),
    );
  }
}
