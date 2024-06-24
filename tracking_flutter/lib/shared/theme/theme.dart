import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking_app/shared/theme/colors.dart';

ThemeData get theme => ThemeData.from(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: primarySwatch,
        backgroundColor: lightBackgroundColor,
      ).copyWith(
        surface: lightBackgroundColor,
      ),
      textTheme: GoogleFonts.latoTextTheme(),
    );
