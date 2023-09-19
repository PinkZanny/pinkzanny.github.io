import 'package:cheap_fit/data/data_sources/shared_prefs.dart';
import 'package:cheap_fit/utils/link_handler.dart';
import 'package:cheap_fit/utils/onesignal_utils.dart';
import 'package:cheap_fit/utils/providers.dart';
import 'package:cheap_fit/utils/providers_push.dart';
import 'package:cheap_fit/utils/session_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MainInitializations {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await sharedPrefs.init();
    Providers.init();
    ProvidersPush.push();
  }

  static Future<void> customInit() async {
    await Permission.activityRecognition.request();
    await OneSignalUtils.init();
    LinkHandler.initAndListen();
    SessionManager().hasReceivedToday == null ? SessionManager().hasReceivedToday = (DateTime.now().subtract(const Duration(days: 1)).day, false) : null;
  }
}
