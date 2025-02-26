import 'package:fitness_tracker/cubits/dashboard_cubit.dart';
import 'package:fitness_tracker/screens/dashboard.dart';
import 'package:fitness_tracker/utils/constants.dart';
import 'package:fitness_tracker/utils/supabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await SupabaseUtils().init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<DashboardCubit>(
        create: (BuildContext context) => DashboardCubit())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Constants.background),
          useMaterial3: true),
      home: Dashboard(),
    );
  }
}
