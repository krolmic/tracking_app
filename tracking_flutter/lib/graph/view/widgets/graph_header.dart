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

    return BlocBuilder<GraphBloc, GraphState>(
      buildWhen: (previous, current) =>
          previous.targetDate.date.year != current.targetDate.date.year,
      builder: (context, state) {
        final nextButtonDisabled =
            state.targetDate.date.year == DateTime.now().year;

        return Row(
          children: [
            Text(
              state.targetDate.date.year.toString(),
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
              onPressed: () {
                context.read<GraphBloc>().add(
                      GraphEvent.targetDateChanged(
                        date: state.targetDate.date.previousYear.add(
                          const Duration(days: 3),
                        ),
                      ),
                    );
              },
            ),
            const HorizontalSpacing.large(),
            IconButton(
              color: AppColors.primarySwatch,
              icon: Icon(
                Iconsax.arrow_right_3_outline,
                size: Theme.of(context).appBarTheme.iconTheme!.size,
              ),
              onPressed: nextButtonDisabled
                  ? null
                  : () {
                      context.read<GraphBloc>().add(
                            GraphEvent.targetDateChanged(
                              date: state.targetDate.date.nextYear.add(
                                const Duration(days: 3),
                              ),
                            ),
                          );
                    },
            ),
          ],
        );
      },
    );
  }
}
