import 'package:difflens/constants/editor_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

RenderEditable? findRenderEditable(RenderObject? root) {
  if (root == null) return null;
  if (root is RenderEditable) return root;
  RenderEditable? found;
  root.visitChildren((child) {
    found ??= findRenderEditable(child);
  });
  return found;
}

class LineNumberPainter extends CustomPainter {
  final GlobalKey textFieldKey;
  final ScrollController scrollController;
  final String text;
  final double lineHeight;
  final double fontSize;

  LineNumberPainter({
    required this.textFieldKey,
    required this.scrollController,
    required this.text,
    required this.lineHeight,
    required this.fontSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);

    final textStyle = TextStyle(
      color: Colors.grey.shade600,
      fontSize: fontSize,
      fontFamily: 'monospace',
    );

    final lines = text.split('\n');

    final textFieldBox =
        textFieldKey.currentContext?.findRenderObject() as RenderBox?;
    final renderEditable = findRenderEditable(textFieldBox);

    int charOffset = 0;

    for (int i = 0; i < lines.length; i++) {
      double yPos;

      if (renderEditable != null &&
          renderEditable.hasSize &&
          textFieldBox != null &&
          textFieldBox.hasSize &&
          charOffset <= text.length) {
        final caretRect = renderEditable.getLocalRectForCaret(
          TextPosition(offset: charOffset),
        );
        yPos = renderEditable
            .localToGlobal(caretRect.topLeft, ancestor: textFieldBox)
            .dy;
      } else {
        final scrollOffset = scrollController.hasClients
            ? scrollController.offset
            : 0.0;
        yPos =
            EditorConstants.verticalPadding + (i * lineHeight) - scrollOffset;
      }

      if (yPos + lineHeight >= 0 && yPos <= size.height) {
        final textSpan = TextSpan(text: '${i + 1}', style: textStyle);

        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        )..layout();

        final verticalOffset = (lineHeight - textPainter.height) / 2;

        textPainter.paint(
          canvas,
          Offset(size.width - textPainter.width - 10, yPos + verticalOffset),
        );
      }

      charOffset += lines[i].length + 1;
    }
  }

  @override
  bool shouldRepaint(covariant LineNumberPainter oldDelegate) {
    return true;
  }
}
