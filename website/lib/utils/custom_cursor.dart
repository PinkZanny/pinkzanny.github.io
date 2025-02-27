import 'package:flutter/material.dart';
import 'package:website/presentation/widgets/topbar.dart';
import 'package:website/utils/screen_size.dart';

class CustomCursor extends StatefulWidget {
  const CustomCursor({required this.page, super.key});

  final Widget page;

  @override
  State<CustomCursor> createState() => _CustomCursorState();
}

class _CustomCursorState extends State<CustomCursor> {
  Offset pointer = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        cursor: SystemMouseCursors.none,
        onHover: (event) {
          setState(() {
            pointer = event.position;
          });
        },
        child: Stack(
          children: [
            const TopBarWidget(),
            widget.page,
            AnimatedPositioned(
              duration: Duration(milliseconds: 100),
              left: pointer.dx,
              top: pointer.dy,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: pointer == Offset.zero
                      ? Colors.transparent
                      : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
