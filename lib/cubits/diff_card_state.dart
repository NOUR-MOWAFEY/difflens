import 'package:difflens/models/diff_line.dart';

class DiffCardState {
  final String oldText;
  final String newText;
  final bool ignoreCase;
  final bool ignoreWhitespace;
  final bool ignoreEmptyLines;
  final List<DiffLine> lines;
  final String diffText;

  const DiffCardState({
    this.oldText = '',
    this.newText = '',
    this.ignoreCase = false,
    this.ignoreWhitespace = false,
    this.ignoreEmptyLines = false,
    this.lines = const [],
    this.diffText = '',
  });

  DiffCardState copyWith({
    String? oldText,
    String? newText,
    bool? ignoreCase,
    bool? ignoreWhitespace,
    bool? ignoreEmptyLines,
    List<DiffLine>? lines,
    String? diffText,
  }) {
    return DiffCardState(
      oldText: oldText ?? this.oldText,
      newText: newText ?? this.newText,
      ignoreCase: ignoreCase ?? this.ignoreCase,
      ignoreWhitespace: ignoreWhitespace ?? this.ignoreWhitespace,
      ignoreEmptyLines: ignoreEmptyLines ?? this.ignoreEmptyLines,
      lines: lines ?? this.lines,
      diffText: diffText ?? this.diffText,
    );
  }
}
