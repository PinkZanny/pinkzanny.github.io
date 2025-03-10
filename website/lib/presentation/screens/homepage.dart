import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:website/presentation/cubits/home_cubit/home_state.dart';
import 'package:website/presentation/widgets/home_authenticated.dart';
import 'package:website/presentation/widgets/home_initial.dart';
import 'package:website/utils/constants.dart';
import 'package:website/utils/responsive_background.dart';
import 'package:website/utils/screen_size.dart';
import 'package:website/utils/session_manager.dart';
import 'package:website/utils/texttheme_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBackground(
        page: Padding(
      padding: EdgeInsets.all(ScreenSize.isWebMobile
          ? Constants.smallPaddingMobile
          : Constants.smallPadding),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            if (SessionManager().user != null) {
              context
                  .read<HomeCubit>()
                  .authenticatedUser(SessionManager().user!);
            }
            return HomeInitialWidget(cubit: context.read<HomeCubit>());
          } else if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (state is AuthenticatedUser) {
            return HomeAuthenticated(
              cubit: context.read<HomeCubit>(),
              name: state.user.displayName ?? "Generic User",
            );
          } else if (state is HomeError) {
            return Center(
              child: Text(
                state.error,
                style: TTheme.bigAssTextBg,
              ),
            );
          } else {
            return const Center(
              child: Text("Unknown state"),
            );
          }
        },
      ),
    ));
  }
}
