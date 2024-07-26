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
  });

  final AuthenticatorState state;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: BaseView(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    // App logo
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
