part of '../home_screen.dart';

class _HomeProgress extends StatelessWidget {
  const _HomeProgress({
    required this.weeklyProgress,
    required this.trackedEveryDayThisWeek,
    required this.trackedToday,
  });

  final double weeklyProgress;
  final bool trackedEveryDayThisWeek;
  final bool trackedToday;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    final title = trackedEveryDayThisWeek
        ? translations.progressDoingGreat
        : translations.progressDoingGood;

    var subtitle = '';
    if (trackedEveryDayThisWeek) {
      subtitle = translations.progressTrackedEveryDay;
    } else if (trackedToday) {
      subtitle = translations.progressTrackedAlmostEveryDay;
    } else {
      subtitle = translations.progressTrackNow;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 125,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            gradientColor1,
            gradientColor2,
            gradientColor3,
            gradientColor4,
          ],
          stops: [0, 0.15, 0.5, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: contentShadowColor,
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      '${(weeklyProgress * 100).toStringAsFixed(0)}%',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: gradientColor4,
                          ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: weeklyProgress),
                        duration: const Duration(milliseconds: 1000),
                        builder: (context, value, _) =>
                            CircularProgressIndicator(
                          value: value,
                          backgroundColor: gradientColor3.withOpacity(0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            darkBlue.withOpacity(0.6),
                          ),
                          strokeCap: StrokeCap.round,
                          strokeWidth: 7,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: contentOnDarkBackgroundColor,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpacing.small(),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: contentOnDarkBackgroundColor,
                        shadows: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
