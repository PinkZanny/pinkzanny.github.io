import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';
import 'package:website/utils/responsive_background.dart';
import 'package:website/utils/screen_size.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBackground(
        page: Padding(
      padding: EdgeInsets.all(ScreenSize.isWebMobile
          ? Constants.smallPaddingMobile
          : Constants.smallPadding),
      child: Column(),
    ));
  }
}
