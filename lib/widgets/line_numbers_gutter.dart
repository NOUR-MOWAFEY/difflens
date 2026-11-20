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
    this.width = EditorConstants.gutterWidth,
    this.lineNumberBuilder,
    this.lineNumberColorBuilder,
  });

  final GlobalKey textFieldKey;
  final ScrollController scrollController;
  final String text;
  final double width;
  final String Function(int lineIndex)? lineNumberBuilder;
  final Color? Function(int lineIndex)? lineNumberColorBuilder;

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
        width: width,
        decoration: const BoxDecoration(color: AppColors.darkCard),
        child: RepaintBoundary(
          child: CustomPaint(
            painter: LineNumberPainter(
              textFieldKey: textFieldKey,
              scrollController: scrollController,
              text: text,
              lineHeight: EditorConstants.lineHeight,
              fontSize: EditorConstants.fontSize,
              lineNumberBuilder: lineNumberBuilder,
              lineNumberColorBuilder: lineNumberColorBuilder,
            ),
            size: Size.infinite,
          ),
        ),
      ),
    );
  }
}
