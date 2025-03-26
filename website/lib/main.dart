import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:website/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:website/presentation/cubits/project_cubit/project_cubit.dart';
import 'package:website/utils/constants.dart';
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
