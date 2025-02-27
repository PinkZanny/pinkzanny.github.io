import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:website/utils/constants.dart';
import 'package:website/utils/routes.dart';
import 'package:website/utils/screen_size.dart';
import 'package:website/utils/texttheme_manager.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).state?.uri;

    return Padding(
      padding: const EdgeInsets.only(
          left: Constants.padding,
          right: Constants.padding,
          top: Constants.padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenSize.isWebMobile
              ? const MobileNavigation()
              : WebNavigation(
                  location: location,
                ),
          SvgPicture.asset('svg/logo.svg',
              height: ScreenSize.isWebMobile
                  ? Constants.logoSizeMobile
                  : Constants.logoSize),
        ],
      ),
    );
  }
}

class WebNavigation extends StatelessWidget {
  const WebNavigation({super.key, required this.location});
  final Uri? location;
  @override
  Widget build(BuildContext context) {
    return NavigationDirectory(
      location: location,
    );
  }
}

class MobileNavigation extends StatelessWidget {
  const MobileNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class NavigationDirectory extends StatelessWidget {
  const NavigationDirectory({super.key, required this.location});
  final Uri? location;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          mouseCursor: SystemMouseCursors.none,
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            context.go('/');
          },
          child: Text(
            "Home",
            style: location.toString() == '/'
                ? TTheme.directoryTextSelected
                : TTheme.directoryText,
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          splashFactory: NoSplash.splashFactory,
          mouseCursor: SystemMouseCursors.none,
          onTap: () {
            context.go(RoutePaths.projects);
          },
          child: Text(
            "Projects",
            style: location.toString() == RoutePaths.projects
                ? TTheme.directoryTextSelected
                : TTheme.directoryText,
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          splashFactory: NoSplash.splashFactory,
          mouseCursor: SystemMouseCursors.none,
          onTap: () {
            context.go(RoutePaths.about);
          },
          child: Text(
            "About",
            style: location.toString() == RoutePaths.about
                ? TTheme.directoryTextSelected
                : TTheme.directoryText,
          ),
        ),
      ],
    );
  }
}
