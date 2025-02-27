import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';
import 'package:website/utils/screen_size.dart';

import '../../utils/responsive_background.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
