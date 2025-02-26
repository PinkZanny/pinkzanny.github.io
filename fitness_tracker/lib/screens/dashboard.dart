import 'package:fitness_tracker/cubits/dashboard_cubit.dart';
import 'package:fitness_tracker/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.background,
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          DashboardCubit cubit = BlocProvider.of<DashboardCubit>(context);
          if (state is DashboardLoading) {
            cubit.load();
            return Center(child: const CupertinoActivityIndicator(color: Colors.white,));
          } else {
            return Container();
          }

        },
      ),
    );
  }
}
