part of '../app.dart';

class _AppLoadingIndicator extends StatelessWidget {
  const _AppLoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.backgroundColor,
      child: Center(
        child: LoadingIndicator(color: AppColors.primarySwatch),
      ),
    );
  }
}
