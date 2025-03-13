import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:google_sign_in_web/web_only.dart';
import 'package:website/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:website/utils/constants.dart';
import 'package:website/utils/screen_size.dart';
import 'package:website/utils/texttheme_manager.dart';

class HomeInitialWidget extends StatelessWidget {
  HomeInitialWidget({required this.cubit, super.key});

  final HomeCubit cubit;

  final GSIButtonConfiguration config = GSIButtonConfiguration(
      type: GSIButtonType.standard,
      theme: GSIButtonTheme.filledBlack,
      size: GSIButtonSize.large,
      text: GSIButtonText.continueWith,
      shape: GSIButtonShape.rectangular,
      locale: "en",
      logoAlignment: GSIButtonLogoAlignment.left);

  @override
  Widget build(BuildContext context) {
    return ScreenSize.isWebMobile
        ? MobileBody(cubit: cubit, config: config)
        : WebBody(cubit: cubit, config: config);
  }
}

class WebBody extends StatelessWidget {
  const WebBody({required this.cubit, required this.config, super.key});

  final HomeCubit cubit;
  final GSIButtonConfiguration config;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi!\nNice to meet you.",
                style: TTheme.displayText,
              ),
              const SizedBox(height: Constants.verySmallPadding),
              Text(
                "Log-in, register or simply roam around.",
                style: TTheme.subText,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          const SizedBox(width: Constants.largePadding),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login.',
                style: TTheme.smallDisplayText,
              ),
              const SizedBox(height: Constants.verySmallPadding),
              MouseRegion(
                  onHover: (eve) {
                    SystemMouseCursors.none;
                  },
                  cursor: SystemMouseCursors.none,
                  child: cubit.googleSignInPlugin
                      .renderButton(configuration: config))
            ],
          )
        ],
      ),
    );
  }
}

class MobileBody extends StatelessWidget {
  const MobileBody({required this.cubit, required this.config, super.key});

  final HomeCubit cubit;
  final GSIButtonConfiguration config;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.smallPadding),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi!\nNice to meet you.",
                  style: TTheme.displayText,
                ),
                const SizedBox(height: Constants.verySmallPadding),
                Text(
                  "Log-in, register or simply roam around.",
                  style: TTheme.subText,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(height: Constants.largePadding),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login.',
                  style: TTheme.smallDisplayText,
                ),
                const SizedBox(height: Constants.verySmallPadding),
                MouseRegion(
                    onHover: (eve) {
                      SystemMouseCursors.none;
                    },
                    cursor: SystemMouseCursors.none,
                    child: cubit.googleSignInPlugin
                        .renderButton(configuration: config))
              ],
            )
          ],
        ),
      ),
    );
  }
}
