part of '../home_screen.dart';

class _HomeMoodsHeader extends StatelessWidget {
  const _HomeMoodsHeader();

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          translations.recentlyTracked,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TextButton(
          onPressed: () {
            context.goNamed(RoutesNames.moods);
          },
          child: Text(
            translations.seeAll,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.blue,
                ),
          ),
        ),
      ],
    );
  }
}
