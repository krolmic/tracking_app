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

    return SizedBox(
      height: 30,
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Text(
                DateTime.now().year.toString(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPaddingSmall,
                ),
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
                    onCancel: () => showToast(
                      context: context,
                      message: translations.subscriptionPurchaseCancelled,
                      icon: const Icon(Iconsax.info_circle_bold),
                    ),
                    onError: () => showToast(
                      context: context,
                      message: translations.subscriptionPurchaseFailed,
                      isError: true,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
