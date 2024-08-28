part of '../graph_screen.dart';

class _LineGraphExplanation extends StatelessWidget {
  const _LineGraphExplanation();

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _LineGraphBarIndicator(
          color: LineGraphTheme.moodsLineChartBarColor,
        ),
        const HorizontalSpacing.small(),
        Text(
          translations.mood,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.grey,
              ),
        ),
        const HorizontalSpacing.large(),
        const _LineGraphBarIndicator(
          color: LineGraphTheme.workHoursLineCharBarColor,
        ),
        const HorizontalSpacing.small(),
        Text(
          translations.workTime,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.grey,
              ),
        ),
        const HorizontalSpacing.large(),
        const _LineGraphBarIndicator(
          color: LineGraphTheme.revenueLineCharBarColor,
        ),
        const HorizontalSpacing.small(),
        Text(
          translations.revenue,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.grey,
              ),
        ),
      ],
    );
  }
}

class _LineGraphBarIndicator extends StatelessWidget {
  const _LineGraphBarIndicator({
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 3,
      color: color,
    );
  }
}
