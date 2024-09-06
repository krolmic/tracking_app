import 'package:error_text_widget/error_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    required this.onRefresh,
    this.message,
    super.key,
  });

  final String? message;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return Center(
      child: ErrorTextWidget(
        titleText: translations.somethingWentWrong,
        descriptionText: message ?? translations.somethingWentWrong,
        onRefresh: onRefresh,
      ),
    );
  }
}
