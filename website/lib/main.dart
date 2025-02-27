import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:website/utils/main_initializations.dart';
import 'package:website/utils/routes.dart';
import 'package:website/utils/screen_size.dart';

void main() async {
  usePathUrlStrategy();
  await MainInitializations.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return MaterialApp.router(
      title: 'TZ.',
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.router,
    );
  }
}
