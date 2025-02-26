import 'package:flutter/material.dart';

class TTheme {
  static TextStyle? displayLarge;
  static TextStyle? displayMedium;
  static TextStyle? displaySmall;
  static TextStyle? headlineLarge;
  static TextStyle? headlineMedium;
  static TextStyle? headlineSmall;
  static TextStyle? bodyLarge;
  static TextStyle? bodyMedium;
  static TextStyle? bodySmall;

  static void init(final BuildContext context) {
    displayLarge = Theme.of(context).textTheme.displayLarge;
    displayMedium = Theme.of(context).textTheme.displayMedium;
    displaySmall = Theme.of(context).textTheme.displaySmall;
    headlineLarge = Theme.of(context).textTheme.headlineLarge;
    headlineMedium = Theme.of(context).textTheme.headlineMedium;
    headlineSmall = Theme.of(context).textTheme.headlineSmall;
    bodyLarge = Theme.of(context).textTheme.bodyLarge;
    bodyMedium = Theme.of(context).textTheme.bodyMedium;
    bodySmall = Theme.of(context).textTheme.bodySmall;
  }
}
