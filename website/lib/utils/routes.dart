import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:website/presentation/screens/about.dart';
import 'package:website/presentation/screens/homepage.dart';
import 'package:website/presentation/screens/projects.dart';

class Routes {
  static final router = GoRouter(
    routerNeglect: true,
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: RoutePaths.projects,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: ProjectsPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: RoutePaths.about,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: AboutPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
    ],
  );
}

class RoutePaths {
  static const String projects = '/projects';
  static const String about = '/about';
}
