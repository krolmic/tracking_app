import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';

class AuthScreenScaffold extends StatelessWidget {
  const AuthScreenScaffold({
    required this.state,
    required this.body,
    super.key,
    this.footer,
    this.onBackButtonPressed,
  });

  final AuthenticatorState state;
  final Widget body;
  final Widget? footer;
  final VoidCallback? onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: onBackButtonPressed != null
            ? IconButton(
                icon: const Icon(Icons.chevron_left, size: 28),
                onPressed: onBackButtonPressed,
              )
            : null,
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: BaseView(
          addVerticalPadding: true,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Center(child: FlutterLogo(size: 100)),
                          const VerticalSpacing.large(),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: body,
                          ),
                        ],
                      ),
                    ),
                    if (footer != null) footer!,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
