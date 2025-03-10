import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:website/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:website/utils/constants.dart';
import 'package:website/utils/screen_size.dart';
import 'package:website/utils/texttheme_manager.dart';

class HomeAuthenticated extends StatelessWidget {
  const HomeAuthenticated({required this.cubit, required this.name, super.key});

  final HomeCubit cubit;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:
                  ScreenSize.width != null ? ScreenSize.width! * 0.5 : 500,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Data Driven.\nTech Enthusiast.\nQuantitatively Inclined.",
                  style: TTheme.displayText,
                ),
                const SizedBox(height: Constants.verySmallPadding),
                Text(
                  "Congratulations $name! \n\nYou gained full access to the website. This means you will be able to view all the information about me, download my CV and articles developed for my projects.",
                  maxLines: 10,
                  style: TTheme.subText,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
