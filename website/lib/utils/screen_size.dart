import 'package:flutter/material.dart';

class ScreenSize {
  static double? height;
  static double? width;
  static double? safeHeight;
  static double? appBarHeight;

  static void init(final BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    safeHeight = MediaQuery.of(context).padding.top;
    appBarHeight = AppBar().preferredSize.height;
  }
}
