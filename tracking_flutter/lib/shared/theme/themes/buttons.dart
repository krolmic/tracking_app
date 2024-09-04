part of '../theme.dart';

final _elevatedButtonStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    color: AppColors.contentOnDarkBackgroundColor,
    fontSize: 16,
  ),
  shadowColor: AppColors.primarySwatch,
  minimumSize: const Size.fromHeight(40),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  backgroundBuilder: (context, state, widget) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            AppColors.blue,
            AppColors.darkBlue,
          ],
          stops: [0, 0.8],
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.primarySwatch,
            blurRadius: 10,
          ),
        ],
      ),
      child: widget,
    );
  },
  backgroundColor: AppColors.blue,
  elevation: 0,
);

final _filledButtonStyle = FilledButton.styleFrom(
  foregroundColor: AppColors.contentOnDarkBackgroundColor,
  textStyle: const TextStyle(
    color: AppColors.contentOnDarkBackgroundColor,
    fontSize: 16,
  ),
  minimumSize: const Size.fromHeight(40),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  backgroundBuilder: (context, state, widget) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            AppColors.blue,
            AppColors.darkBlue,
          ],
          stops: [0, 0.8],
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.primarySwatch,
            blurRadius: 10,
          ),
        ],
      ),
      child: widget,
    );
  },
  backgroundColor: AppColors.blue,
  elevation: 0,
);
