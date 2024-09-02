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
                onPressed: () async {
                  await showSettingsDialog(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
