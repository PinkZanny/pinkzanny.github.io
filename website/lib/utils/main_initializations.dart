import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:website/firebase_options.dart';
import 'package:website/utils/providers.dart';
import 'package:website/utils/providers_push.dart';
import 'package:website/utils/shared_prefs.dart';

class MainInitializations {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await sharedPrefs.init();
    Providers.init();
    ProvidersPush.push();
  }

  static Future<void> customInit() async {}
}
