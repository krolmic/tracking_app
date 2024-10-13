part of '../home_screen.dart';

class _HomeMoodsHeader extends StatelessWidget {
  const _HomeMoodsHeader();

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return Container(
      height: 65,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.9, 1.0],
          colors: <Color>[
            AppColors.backgroundColor,
            Colors.white.withOpacity(0),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: verticalPaddingLarge,
          bottom: verticalPaddingMedium,
        ),
        child: Row(
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
        ),
      ),
    );
  }
}
