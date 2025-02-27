import 'dart:async';

import 'package:flutter/cupertino.dart';

class Navi {
  static late NavigatorState? _navi;
  static late NavigatorState? _naviRoot;

  static void init(final BuildContext context) {
    _navi = Navigator.of(context);
    _naviRoot = Navigator.of(context, rootNavigator: true);
  }

  static void push(final Widget newPage) {
    unawaited(_navi!.push(
        CupertinoPageRoute(builder: (final BuildContext context) => newPage)));
  }

  static void pop(final BuildContext context) {
    _navi!.pop(context);
  }

  static void pushReplacement(final Widget newPage) {
    unawaited(_navi!.pushReplacement(
        CupertinoPageRoute(builder: (final BuildContext context) => newPage)));
  }

  static void pushWithRoot(final Widget newPage) {
    unawaited(_naviRoot!.push(
        CupertinoPageRoute(builder: (final BuildContext context) => newPage)));
  }

  static void pushAndRemoveUntil(final Widget newPage,
      {final bool boolRoute = false}) {
    unawaited(_navi!.pushAndRemoveUntil(
        CupertinoPageRoute(builder: (final BuildContext context) => newPage),
        (final route) => boolRoute));
  }
}
