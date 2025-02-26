import 'package:flutter/material.dart';
import 'package:website/utils/providers.dart';
import 'package:website/utils/providers_push.dart';
import 'package:website/utils/shared_prefs.dart';

class MainInitializations {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await sharedPrefs.init();
    Providers.init();
    ProvidersPush.push();
  }

  static Future<void> customInit() async {}
}
