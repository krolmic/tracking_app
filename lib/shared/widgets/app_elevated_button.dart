import 'package:flutter/material.dart';
import 'package:tracking_app/shared/constants/colors.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    required this.isLoading,
    required this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final bool isLoading;
  final IconData icon;
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      key: key,
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(),
            )
          : const Icon(
              Icons.edit,
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
