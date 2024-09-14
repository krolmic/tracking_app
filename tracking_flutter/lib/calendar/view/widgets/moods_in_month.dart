part of '../calendar_screen.dart';

class _MoodsInMonth extends StatelessWidget {
  const _MoodsInMonth({
    required this.moods,
    required this.isLoading,
  });

  final List<Mood> moods;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final skeletonMoods = List.generate(
      10,
      (index) => Mood(
        id: index,
        createdOn: DateTime.now(),
        value: 10,
      ),
    );

    final moodsToBuild = isLoading ? skeletonMoods : moods;

    return MoodsShaderMask(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: const [0.0, 0.9, 1.0],
      child: SizedBox(
        height: 160,
        width: double.infinity,
        child: Skeletonizer(
          enabled: isLoading,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moodsToBuild.length,
            itemBuilder: (context, index) {
              return Padding(
                key: ValueKey(moodsToBuild[index]),
                padding: EdgeInsets.only(
                  right: index == moodsToBuild.length - 1
                      ? viewPaddingHorizontal
                      : verticalPaddingSmall,
                  bottom: horizontalPaddingMedium,
                  left: index == 0 ? viewPaddingHorizontal : 0,
                ),
                child: _TrackedMood(mood: moodsToBuild[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
