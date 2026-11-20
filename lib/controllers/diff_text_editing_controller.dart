import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/models/diff_line.dart';
import 'package:flutter/material.dart';

class DiffTextEditingController extends TextEditingController {
  List<DiffLine> lines = const [];

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    if (lines.isEmpty || text.isEmpty) {
      return TextSpan(style: style, text: text);
    }

    final spans = <TextSpan>[];

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      final isLast = i == lines.length - 1;
      final lineText = line.formattedText + (isLast ? '' : '\n');

      Color textColor;
      Color? bgColor;

      switch (line.type) {
        case DiffType.added:
          textColor = AppColors.diffAdded;
          bgColor = AppColors.diffAddedBg;
          break;
        case DiffType.deleted:
          textColor = AppColors.diffDeleted;
          bgColor = AppColors.diffDeletedBg;
          break;
        case DiffType.same:
          textColor = style?.color ?? AppColors.text;
          bgColor = null;
          break;
      }

      spans.add(
        TextSpan(
          text: lineText,
          style: (style ?? const TextStyle()).copyWith(
            color: textColor,
            backgroundColor: bgColor,
          ),
        ),
      );
    }

    return TextSpan(children: spans);
  }
}
