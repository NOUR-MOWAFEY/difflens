enum DiffType { same, added, deleted }

class DiffLine {
  final int? oldLineNumber;
  final int? newLineNumber;
  final String text;
  final DiffType type;

  const DiffLine({
    this.oldLineNumber,
    this.newLineNumber,
    required this.text,
    required this.type,
  });

  String get formattedText {
    switch (type) {
      case DiffType.added:
        return '+ $text';
      case DiffType.deleted:
        return '- $text';
      case DiffType.same:
        return '  $text';
    }
  }
}
