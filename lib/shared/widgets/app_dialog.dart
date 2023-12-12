import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    required this.title,
    required this.subTitle,
    required this.confirmButtonText,
    required this.onConfirm,
    this.cancelButtonText,
    this.onCancel,
    super.key,
  });

  final String title;
  final String subTitle;
  final String confirmButtonText;
  final VoidCallback onConfirm;
  final String? cancelButtonText;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(subTitle),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: onCancel ?? Navigator.of(context).pop,
          child: Text(
            cancelButtonText ??
                AppLocalizations.of(context)!.cancel.toUpperCase(),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: onConfirm,
          child: Text(confirmButtonText),
        ),
      ],
    );
  }
}
