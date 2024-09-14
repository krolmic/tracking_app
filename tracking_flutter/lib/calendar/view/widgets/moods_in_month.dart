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
      child: SizedBox(
        height: 160,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: moods.length,
          itemBuilder: (context, index) {
            return Padding(
              key: ValueKey(moods[index]),
              padding: EdgeInsets.only(
                right: index == moods.length - 1
                    ? viewPaddingHorizontal
                    : verticalPaddingSmall,
                bottom: horizontalPaddingMedium,
                left: index == 0 ? viewPaddingHorizontal : 0,
              ),
              child: _TrackedMood(mood: moods[index]),
            );
          },
        ),
      ),
    );
  }
}
