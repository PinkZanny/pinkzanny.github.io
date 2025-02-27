import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:website/utils/constants.dart';
import 'package:website/utils/custom_cursor.dart';
import 'package:website/utils/screen_size.dart';
import 'package:website/utils/texttheme_manager.dart';

class ResponsiveBackground extends StatelessWidget {
  const ResponsiveBackground({required this.page, super.key});

  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: ScreenSize.height!,
        maxWidth: ScreenSize.width!,
      ),
      child: Container(
        color: Constants.backgroundColor,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.isWebMobile
                    ? Constants.smallPaddingMobile
                    : Constants.smallPadding,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: Constants.smallPaddingMobile,
                    ),
                    child: Text('2025 By Tommaso Zanatta',
                        style: TTheme.smallText),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Tommaso\nZanatta',
                        textAlign: TextAlign.right,
                        style: TTheme.bigAssTextBg,
                      ),
                    ),
                  )
                ],
              ),
            ),
            CustomCursor(page: page),
          ],
        ),
      ),
    );
  }
}
