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

  static BoxShadow textShadow = BoxShadow(
    color: Colors.black.withOpacity(0.3),
    blurRadius: 2,
  );

  void onTap(BuildContext context) {
    if (trackedEveryDayThisWeek || trackedToday) {
      context.goNamed(RoutesNames.calendar);
    } else {
      context.pushNamed(
        RoutesNames.createMoodFromHome,
        extra: CreateMoodRouteParameters(
          date: DateTime.now(),
        ),
      );
    }
  }

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

    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        margin: const EdgeInsets.only(
          left: viewPaddingHorizontal + verticalPaddingExtraSmall,
          right: viewPaddingHorizontal + verticalPaddingExtraSmall,
          top: verticalPaddingLarge,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              AppColors.gradientColor1,
              AppColors.gradientColor2,
              AppColors.gradientColor3,
              AppColors.gradientColor4,
            ],
            stops: [0, 0.15, 0.5, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.contentShadowColor,
              blurRadius: 10,
            ),
          ],
        ),
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
                            color: AppColors.gradientColor4,
                          ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: weeklyProgress),
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 1000),
                        builder: (context, value, _) {
                          return CircularProgressIndicator(
                            value: value,
                            backgroundColor: AppColors.blue.withOpacity(0.3),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.darkBlue.withOpacity(0.6),
                            ),
                            strokeCap: StrokeCap.round,
                            strokeWidth: 7,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: horizontalPaddingSmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.contentOnDarkBackgroundColor,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          textShadow,
                        ],
                      ),
                    ),
                    const VerticalSpacing.small(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            subtitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                              color: AppColors.contentOnDarkBackgroundColor,
                              shadows: [
                                textShadow,
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            color: AppColors.primarySwatch,
                            onPressed: () => onTap(context),
                            icon: const Icon(Iconsax.arrow_right_3_outline),
                          ),
                        ),
                      ],
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
