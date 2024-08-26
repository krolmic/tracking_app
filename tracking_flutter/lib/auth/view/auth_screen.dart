import 'package:flutter/material.dart';
import 'package:tracking_app/gen/assets.gen.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    required this.body,
    super.key,
    this.footer,
    this.onBackButtonPressed,
  });

  final Widget body;
  final Widget? footer;
  final VoidCallback? onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: onBackButtonPressed != null
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.chevron_left, size: 28),
                onPressed: onBackButtonPressed,
              ),
            )
          : null,
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: BaseView(
          addVerticalPadding: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Assets.images.adaptiveIconForeground.image(
                    width: 100,
                    height: 100,
                  ),
                ),
                const VerticalSpacing.extraLarge(),
                Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: body,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: viewPaddingVertical),
        child: footer,
      ),
    );
  }
}
