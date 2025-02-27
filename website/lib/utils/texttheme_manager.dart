import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';
import 'package:website/utils/screen_size.dart';

class TTheme {
  static TextStyle bigAssTextBg = TextStyle(
    fontSize: ScreenSize.isWebMobile
        ? Constants.bigAssTextMobile
        : Constants.bigAssText,
    fontFamily: 'Helvetica Neue Bold',
    color: Constants.secondaryColor,
    decoration: TextDecoration.none,
  );

  static TextStyle smallText = TextStyle(
    fontSize: ScreenSize.isWebMobile
        ? Constants.smallTextMobile
        : Constants.smallText,
    fontFamily: 'Satoshi Regular',
    color: Colors.white,
    decoration: TextDecoration.none,
  );

  static TextStyle directoryText = TextStyle(
    fontSize:
        ScreenSize.isWebMobile ? Constants.bodyTextMobile : Constants.bodyText,
    fontFamily: 'Satoshi Regular',
    color: Colors.white,
    decoration: TextDecoration.none,
  );

  static TextStyle directoryTextSelected = TextStyle(
    fontSize:
        ScreenSize.isWebMobile ? Constants.bodyTextMobile : Constants.bodyText,
    fontFamily: 'Satoshi Regular',
    color: Colors.white,
    decoration: TextDecoration.underline,
  );
}
