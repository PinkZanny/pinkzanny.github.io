import 'package:cheap_fit/data/data_sources/api_data_source.dart';
import 'package:cheap_fit/data/data_sources/shared_prefs.dart';
import 'package:cheap_fit/data/models/error_api_model.dart';
import 'package:cheap_fit/data/models/refresh_token_response_model.dart';
import 'package:cheap_fit/presentation/cubits/navigation/navbar_items.dart';
import 'package:cheap_fit/presentation/screens/entry/splash_login.dart';
import 'package:cheap_fit/presentation/screens/navigation/bottom_navigation.dart';
import 'package:cheap_fit/utils/constants.dart';
import 'package:cheap_fit/utils/navi.dart';
import 'package:flutter/material.dart';

class ApiErrorHandler {
  static Future<bool> handleErrors({required final Map<String, dynamic> body, final bool? fromHome}) async {
    if (body['statusCode'] != null) {
      final ErrorModel errorModel = ErrorModel.fromJson(body);
      switch (errorModel.error?.statusCode) {
        case 400:
          debugPrint('${errorModel.error?.statusCode}: Bad Request');
        case 422:
          debugPrint('${errorModel.error?.statusCode}: Unprocessable Entity');
      }
    } else if (body['status'] == 401) {
      debugPrint('${body['status']}: Unauthorized');
      final Map<String, dynamic> newBody = await ApiDataSource.refreshToken();
      final RefreshToken response = RefreshToken.fromJson(newBody);
      if (response.data == null) {
        await sharedPrefs.remove(Constants.userId);
        await sharedPrefs.remove(Constants.accessToken);
        await sharedPrefs.remove(Constants.refreshToken);
        Navi.pushWithRoot(SplashLogin(key: Constants.apiErrorKey));
        return false;
      } else {
        await sharedPrefs.set(Constants.userId, response.data!.userId!);
        await sharedPrefs.set(Constants.accessToken, response.data!.accessToken!);
        await sharedPrefs.set(Constants.refreshToken, response.data!.refreshToken!);
        if (fromHome != null) {
          Navi.pushWithRoot(const BottomNavBar(initialNavItem: NavBarItem.home));
        }
        return true;
      }
    }
    return false;
  }
}
