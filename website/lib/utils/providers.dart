import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers {
  static final List<BlocProvider> blocProviders = [];

  static List<BlocProvider> provideBlocs() => blocProviders;

  static void addBlocProvider<T extends Cubit>(final T cubit) {
    final BlocProvider<T> provider = BlocProvider<T>.value(
      value: cubit,
    );
    blocProviders.add(provider);
  }

  static T getInstance<T extends Cubit>(final BuildContext context) => BlocProvider.of<T>(context);

  static void init() => blocProviders.clear();
}
