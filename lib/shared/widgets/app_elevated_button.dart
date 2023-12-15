import 'package:flutter/material.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    required this.isLoading,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isDisabled = false,
    super.key,
  });

  final bool isLoading;
  final bool isDisabled;
  final IconData icon;
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      key: key,
      onPressed: isDisabled || isLoading ? null : onPressed,
      icon: isLoading
          ? const TinyLoadingIndicator(color: Colors.white)
          : Icon(
              icon,
              color: Colors.white,
            ),
      label: isLoading
          ? const SizedBox.shrink()
          : Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: primarySwatch,
      ),
    );
  }
}
