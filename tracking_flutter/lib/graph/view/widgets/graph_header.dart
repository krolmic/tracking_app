part of '../graph_screen.dart';

class _GraphHeader extends StatelessWidget {
  const _GraphHeader();

  Future<void> showSettingsDialog(
    BuildContext context,
  ) {
    return showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final translations = AppLocalizations.of(context)!;

        return AppDialog(
          title: translations.display,
          body: BlocProvider.value(
            value: BlocProvider.of<GraphBloc>(context),
            child: const _GraphSettings(),
          ),
          confirmButtonText: translations.ok,
          onConfirm: () {
            Navigator.of(dialogContext).pop();
          },
          buildCancelButton: false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return Row(
      children: [
        Text(
          DateTime.now().year.toString(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Spacer(),
        IconButton(
          color: AppColors.primarySwatch,
          icon: Icon(
            Iconsax.setting_4_outline,
            size: Theme.of(context).appBarTheme.iconTheme!.size,
          ),
          onPressed: () {
            RevenueCatUIHelper.showPaywallIfNecessary(
              requiresSubscriptionCallback: () async {
                await showSettingsDialog(context);
              },
              onPurchased: () => showToast(
                context: context,
                message: translations.subscriptionPurchaseSuccessful,
              ),
              onRestored: () => showToast(
                context: context,
                message: translations.subscriptionPurchaseRestored,
              ),
              onError: () => showToast(
                context: context,
                message: translations.subscriptionPurchaseFailed,
                isError: true,
              ),
            );
          },
        ),
        const HorizontalSpacing.large(),
        IconButton(
          color: AppColors.primarySwatch,
          icon: Icon(
            Iconsax.arrow_left_2_outline,
            size: Theme.of(context).appBarTheme.iconTheme!.size,
          ),
          onPressed: () {},
        ),
        const HorizontalSpacing.large(),
        IconButton(
          color: AppColors.primarySwatch,
          icon: Icon(
            Iconsax.arrow_right_3_outline,
            size: Theme.of(context).appBarTheme.iconTheme!.size,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
