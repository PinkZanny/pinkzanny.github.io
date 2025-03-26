import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:website/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:website/presentation/cubits/project_cubit/project_cubit.dart';
import 'package:website/utils/constants.dart';
import 'package:website/utils/main_initializations.dart';
import 'package:website/utils/routes.dart';
import 'package:website/utils/screen_size.dart';
import 'dart:html' as html;

import 'package:website/utils/texttheme_manager.dart';

void main() async {
  usePathUrlStrategy();
  await MainInitializations.init();

  final userAgent = html.window.navigator.userAgent;
  final isLinkedInWebView =
      userAgent.contains("LinkedIn") || userAgent.contains("linkedin");

  if (isLinkedInWebView) {
    runApp(const LinkedInWebViewHandler());
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final HomeCubit cubit = HomeCubit();
            cubit.initPlugin();
            return cubit;
          },
        ),
        BlocProvider(
          create: (context) => ProjectCubit()..getProjects(),
        ),
      ],
      child: MouseRegion(
        cursor: SystemMouseCursors.none,
        child: MaterialApp.router(
          color: Constants.backgroundColor,
          title: 'TZ.',
          debugShowCheckedModeBanner: false,
          routerConfig: Routes.router,
        ),
      ),
    );
  }
}

class LinkedInWebViewHandler extends StatelessWidget {
  const LinkedInWebViewHandler({super.key});

  Future<void> _openInExternalBrowser(BuildContext context) async {
    // final Uri url = Uri.parse(html.window.location.href);
    final anchor = html.AnchorElement(href: html.window.location.href)
      ..target = '_blank'
      ..rel = 'noopener noreferrer';
    anchor.click();
    html.window.open(html.window.location.href, '_blank');
    html.window.location.href = html.window.location.href;
    // if (await canLaunchUrl(url)) {
    //   await launchUrl(url, mode: LaunchMode.externalApplication);
    // } else {
    //   if (context.mounted) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text("Could not open the link."),
    //       ),
    //     );
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Constants.backgroundColor,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Unfortunately, LinkedIn WebView doesn't really like Flutter Web.",
                style: TTheme.smallDisplayText.copyWith(fontSize: 11)),
            const SizedBox(
              height: Constants.smallPadding,
            ),
            Text(
              "If the button below doesn't work, please click on the three dots on the top right corner of the screen and select 'Open in Browser'.",
              style: TTheme.subText.copyWith(fontSize: 10),
            ),
            const SizedBox(
              height: Constants.smallPadding,
            ),
            Material(
              color: Colors.transparent,
              borderOnForeground: false,
              child: InkWell(
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                mouseCursor: SystemMouseCursors.none,
                onTap: () {
                  _openInExternalBrowser(context);
                },
                child: Container(
                  height: 44,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Constants.accentColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Constants.smallPadding),
                    child: Center(
                      child: Text(
                        "Open In External Browser",
                        style: TTheme.directoryTextSelected.copyWith(
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
