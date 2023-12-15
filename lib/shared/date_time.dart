import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jiffy/jiffy.dart';

String getDateString(BuildContext context, DateTime date) {
  if (_dateIsToday(date)) {
    return AppLocalizations.of(context)!.today;
  }

  return Jiffy.parseFromDateTime(date).yMMMMd;
}

String getTimeString(DateTime date) {
  return Jiffy.parseFromDateTime(date).jm;
}

bool _dateIsToday(DateTime date) {
  final now = DateTime.now();

  return date.day == now.day &&
      date.month == now.month &&
      date.year == now.year;
}
