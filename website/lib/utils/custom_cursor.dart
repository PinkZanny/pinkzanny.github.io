import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:website/presentation/widgets/topbar.dart';

class CustomCursor extends StatefulWidget {
  const CustomCursor({required this.page, super.key});

  final Widget page;

  @override
  State<CustomCursor> createState() => _CustomCursorState();
}

class _CustomCursorState extends State<CustomCursor> {
  Offset pointer = Offset.zero;
  bool _firstEvent = true;

  @override
  Widget build(BuildContext context) {
    Widget content = Stack(
      children: [
        const TopBarWidget(),
        widget.page,
        _firstEvent
            ? Positioned(
                left: pointer.dx,
                top: pointer.dy,
                child: _buildCursor(),
              )
            : AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                left: pointer.dx,
                top: pointer.dy,
                child: _buildCursor(),
              ),
      ],
    );

    if (kIsWeb &&
        ![TargetPlatform.iOS, TargetPlatform.android]
            .contains(defaultTargetPlatform)) {
      return Scaffold(
        body: MouseRegion(
          cursor: SystemMouseCursors.none,
          onEnter: (event) {
            setState(() {
              pointer = event.localPosition;
            });
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (_firstEvent) {
                setState(() {
                  _firstEvent = false;
                });
              }
            });
          },
          onHover: (event) {
            setState(() {
              pointer = event.localPosition;
            });
          },
          child: content,
        ),
        backgroundColor: Colors.transparent,
      );
    } else {
      return Scaffold(
        body: content,
        backgroundColor: Colors.transparent,
      );
    }
  }

  Widget _buildCursor() {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
