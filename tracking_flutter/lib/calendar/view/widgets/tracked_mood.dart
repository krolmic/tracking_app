part of '../calendar_screen.dart';

class _TrackedMood extends StatelessWidget {
  const _TrackedMood({
    required this.mood,
  });

  final Mood mood;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () => context.pushNamed(
        RoutesNames.updateMoodFromCalendar,
        extra: UpdateMoodRouteParameters(mood: mood),
      ),
      child: Card(
        elevation: 5,
        shadowColor: AppColors.contentShadowColor,
        child: Container(
          width: 100,
          height: 150,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: MoodEmoji(
                    moodValue: mood.value,
                  ),
                ),
              ),
              const VerticalSpacing.small(),
              Text(
                mood.createdOn.getDateString(
                  context,
                  includeYear: false,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '${translations.mood}: ${mood.value}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.tileSubtitleColor,
                    ),
              ),
              const VerticalSpacing.medium(),
              Icon(
                Iconsax.edit_2_outline,
                size: 20,
                color: AppColors.tileIconColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
