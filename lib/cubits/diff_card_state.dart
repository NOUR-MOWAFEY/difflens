import 'package:difflens/models/diff_line.dart';

class DiffCardState {
  final String oldText;
  final String newText;
  final bool ignoreCase;
  final bool ignoreWhitespace;
  final bool ignoreEmptyLines;
  final List<DiffLine> lines;
  final String diffText;
  final int addedLines;
  final int removedLines;
  final int sameLines;
  final int similarityPercentage;

  const DiffCardState({
    this.oldText = '',
    this.newText = '',
    this.ignoreCase = false,
    this.ignoreWhitespace = false,
    this.ignoreEmptyLines = false,
    this.lines = const [],
    this.diffText = '',
    this.addedLines = 0,
    this.removedLines = 0,
    this.sameLines = 0,
    this.similarityPercentage = 100,
  });

  DiffCardState copyWith({
    String? oldText,
    String? newText,
    bool? ignoreCase,
    bool? ignoreWhitespace,
    bool? ignoreEmptyLines,
    List<DiffLine>? lines,
    String? diffText,
    int? addedLines,
    int? removedLines,
    int? sameLines,
    int? similarityPercentage,
  }) {
    return DiffCardState(
      oldText: oldText ?? this.oldText,
      newText: newText ?? this.newText,
      ignoreCase: ignoreCase ?? this.ignoreCase,
      ignoreWhitespace: ignoreWhitespace ?? this.ignoreWhitespace,
      ignoreEmptyLines: ignoreEmptyLines ?? this.ignoreEmptyLines,
      lines: lines ?? this.lines,
      diffText: diffText ?? this.diffText,
      addedLines: addedLines ?? this.addedLines,
      removedLines: removedLines ?? this.removedLines,
      sameLines: sameLines ?? this.sameLines,
      similarityPercentage:
          similarityPercentage ?? this.similarityPercentage,
    );
  }
}
