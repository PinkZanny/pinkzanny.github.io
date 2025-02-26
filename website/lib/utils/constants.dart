import 'package:flutter/material.dart';

class Constants {
  static const String currentVersion = '2.0.6+21';
  static const String appStoreLink = 'https://apps.apple.com/it/app/cheap-fit/id6444658762?l=it-IT';
  static const String playStoreLink = 'https://play.google.com/store/apps/details?id=it.cheapfit.cheapfitapp&pcampaignid=web_share';

  static const LinearGradient splashLoginGradient = LinearGradient(colors: [Color(0xFF184E4A), Color(0xFF1B2325)], begin: Alignment.bottomCenter, end: Alignment.topCenter);

  static const Color primaryGreen = Color(0xFF2BB083);
  static const Color seeThroughWhite = Color(0x80FFFFFF);
  static const Color darkGreen = Color(0xFF254A4C);
  static const Color cheapGrey = Color(0xFFD9D9D9);
  static const Color customBG = Color(0xFFfbfdf9);
  static const Color errorContainer = Color(0xFFffdad6);
  static const Color errorTextColor = Color(0xFFba1a1a);
  static const Color secondaryText = Color(0xFF006874);
  static const Color primaryText = Color(0xFF191c1a);
  static const Color alternativeSurface = Color(0xFFdbe5dd);

  static const List<BoxShadow> mainContainerShadow = [BoxShadow(color: Color(0xA0000000), blurRadius: 20, spreadRadius: 1)];
  static const List<BoxShadow> secondaryShadow = [BoxShadow(color: Color(0x4C000000), blurRadius: 25, spreadRadius: 1)];
  static const List<BoxShadow> buttonShadow = [BoxShadow(color: Color(0x27000000), blurRadius: 7, spreadRadius: 0.3)];

  static const String apiEndpoint = 'https://api.cheapfit.it';
  static const String apiKey =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiSUdTb2x1dGlvbnMiLCJzdXJuYW1lIjoiSUdTb2x1dGlvbnMiLCJpZCI6LTIyMTU3Mzk0OTMsImp0aSI6ImJiZDBjZWUxLWRiNzMtNGZlMC1iM2EwLTI0Y2UzNWJjNTJmNCIsImlhdCI6MTU4NTMwOTUwOSwiZXhwIjo0MDc4MzAyODA4fQ.QdG2G7GizuuNHdChAtjPah4lmasyDlMOvo2fmUFZKGg';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String userId = 'userId';

  static var keys = [GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>()];
  static GlobalKey navigationKey = GlobalKey();
  static GlobalKey<NavigatorState> newNavKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> updatedCompanyNavKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> tournamentNavKey = GlobalKey<NavigatorState>();
  static List<Key> snackBarKeys = [GlobalKey<ScaffoldMessengerState>(), GlobalKey<ScaffoldMessengerState>(), GlobalKey<ScaffoldMessengerState>()];
  static GlobalKey<NavigatorState> apiErrorKey = GlobalKey<NavigatorState>();

  static String oneSignalAppId = 'fa576cbb-3c71-4ce0-bb19-fea8d65a4da3';
  static String oneSignalApiKey = 'Zjg1MWRkZDMtN2Y0My00NDhmLTg2ZDUtZjRkNDZiMjQyMWU3';
}
