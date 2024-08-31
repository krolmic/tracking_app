import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    required this.title,
    required this.body,
    this.buildConfirmButton = true,
    this.confirmButtonText,
    this.onConfirm,
    this.buildCancelButton = true,
    this.cancelButtonText,
    this.onCancel,
    super.key,
  });

  final String title;
  final Widget body;
  final bool buildConfirmButton;
  final String? confirmButtonText;
  final VoidCallback? onConfirm;
  final bool buildCancelButton;
  final String? cancelButtonText;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: body,
      actions: <Widget>[
        if (buildCancelButton)
          TextButton(
            onPressed: onCancel ?? Navigator.of(context).pop,
            child: Text(
              cancelButtonText ?? AppLocalizations.of(context)!.cancel,
            ),
          ),
        if (buildConfirmButton)
          TextButton(
            onPressed: onConfirm ?? Navigator.of(context).pop,
            child: Text(
              confirmButtonText ?? AppLocalizations.of(context)!.confirm,
            ),
          ),
      ],
    );
  }
}
