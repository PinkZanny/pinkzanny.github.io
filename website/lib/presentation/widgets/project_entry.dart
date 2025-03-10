import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:website/utils/constants.dart';
import 'package:website/utils/texttheme_manager.dart';

class ProjectEntryWidget extends StatelessWidget {
  const ProjectEntryWidget(
      {required this.projectName, required this.projectDescription, super.key});

  final String projectName;
  final String projectDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                projectName,
                style: TTheme.smallDisplayText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            Text(
              ' - ',
              style: TTheme.subText,
            ),
            Expanded(
              flex: 2,
              child: Text(
                projectDescription,
                style: TTheme.subText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            const SizedBox(
              width: Constants.verySmallPadding,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            )
          ],
        ),
        const Divider(
          color: Constants.secondaryColor,
        )
      ],
    );
  }
}
