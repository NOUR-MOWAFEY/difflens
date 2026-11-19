import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/constants/editor_constants.dart';
import 'package:difflens/widgets/line_number_painter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LineNumbersGutter extends StatelessWidget {
  const LineNumbersGutter({
    super.key,
    required this.textFieldKey,
    required this.scrollController,
    required this.text,
  });

  final GlobalKey textFieldKey;
  final ScrollController scrollController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (event) {
        if (event is PointerScrollEvent && scrollController.hasClients) {
          scrollController.jumpTo(
            (scrollController.offset + event.scrollDelta.dy).clamp(
              0.0,
              scrollController.position.maxScrollExtent,
            ),
          );
        }
      },
      child: Container(
        width: EditorConstants.gutterWidth,
        decoration: const BoxDecoration(color: AppColors.darkCard),
        child: RepaintBoundary(
          child: CustomPaint(
            painter: LineNumberPainter(
              textFieldKey: textFieldKey,
              scrollController: scrollController,
              text: text,
              lineHeight: EditorConstants.lineHeight,
              fontSize: EditorConstants.fontSize,
            ),
            size: Size.infinite,
          ),
        ),
      ),
    );
  }
}
