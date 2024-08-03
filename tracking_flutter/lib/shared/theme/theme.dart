import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking_app/shared/theme/colors.dart';

ThemeData get theme => ThemeData.from(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: primarySwatch,
        backgroundColor: backgroundColor,
      ).copyWith(
        surface: backgroundColor,
      ),
      textTheme: textTheme,
    ).copyWith(
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primarySwatch,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: primarySwatch,
          size: 18,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: lightGrey,
        space: 1,
        thickness: 1,
      ),
      inputDecorationTheme: inputDecorationTheme,
      checkboxTheme: checkBoxTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: elevatedButtonStyle,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: filledButtonStyle,
      ),
    );

final textTheme = GoogleFonts.latoTextTheme().copyWith(
  headlineLarge: GoogleFonts.lato(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  ),
  headlineMedium: GoogleFonts.lato(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ),
  headlineSmall: GoogleFonts.lato(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
  titleLarge: GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
  titleSmall: GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  ),
  bodySmall: GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: bodySmallTextColor,
  ),
  bodyMedium: GoogleFonts.lato(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ),
  bodyLarge: GoogleFonts.lato(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ),
);

final inputDecorationTheme = InputDecorationTheme(
  suffixIconColor: primarySwatch,
  filled: true,
  fillColor: inputFillColor,
  labelStyle: const TextStyle(
    color: darkBlue,
    fontSize: 14,
  ),
  hintStyle: TextStyle(
    color: bodySmallTextColor.withOpacity(0.5),
    fontSize: 14,
  ),
  helperStyle: const TextStyle(
    color: darkBlue,
    fontSize: 11,
  ),
  border: const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  contentPadding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  ),
  floatingLabelBehavior: FloatingLabelBehavior.never,
  hoverColor: primarySwatch,
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusColor: primarySwatch,
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

final checkBoxTheme = CheckboxThemeData(
  fillColor: WidgetStateProperty.all(inputFillColor),
  checkColor: WidgetStateProperty.all(primarySwatch),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
  side: const BorderSide(
    color: Colors.transparent,
  ),
);

final elevatedButtonStyle = ElevatedButton.styleFrom(
  shadowColor: primarySwatch,
  minimumSize: const Size.fromHeight(40),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  backgroundBuilder: (context, state, widget) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            buttonsGradientColor1,
            buttonsGradientColor2,
          ],
          stops: [0, 0.8],
        ),
        boxShadow: const [
          BoxShadow(
            color: primarySwatch,
            blurRadius: 10,
          ),
        ],
      ),
      child: widget,
    );
  },
  backgroundColor: gradientColor3,
  elevation: 0,
);

final filledButtonStyle = FilledButton.styleFrom(
  foregroundColor: contentOnDarkBackgroundColor,
  textStyle: const TextStyle(
    color: contentOnDarkBackgroundColor,
  ),
  minimumSize: const Size.fromHeight(40),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  backgroundBuilder: (context, state, widget) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            buttonsGradientColor1,
            buttonsGradientColor2,
          ],
          stops: [0, 0.8],
        ),
        boxShadow: const [
          BoxShadow(
            color: primarySwatch,
            blurRadius: 10,
          ),
        ],
      ),
      child: widget,
    );
  },
  backgroundColor: gradientColor3,
  elevation: 0,
);
