part of '../app.dart';

class _AppErrorMessage extends StatelessWidget {
  const _AppErrorMessage({
    required this.translations,
  });

  final AppLocalizations translations;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.backgroundColor,
      child: ErrorMessage(
        message: translations.appInitFailed,
        onRefresh: () {
          context.read<AppCubit>().init();
          context
              .read<AppSettingsBloc>()
              .add(const AppSettingsEvent.settingsInitialized());
        },
      ),
    );
  }
}
