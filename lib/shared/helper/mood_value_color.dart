import 'package:flutter/material.dart';
import 'package:tracking_app/shared/constants/colors.dart';

Color moodValueColor(int moodValue) {
  if (moodValue >= 9) {
    return moodValueColor5;
  } else if (moodValue >= 6) {
    return moodValueColor4;
  } else if (moodValue >= 4) {
    return moodValueColor3;
  } else if (moodValue >= 2) {
    return moodValueColor2;
  } else {
    return moodValueColor1;
  }
}
