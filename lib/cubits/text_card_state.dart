class TextCardState {
  final String text;
  final int lineCount;

  const TextCardState({
    this.text = '',
    this.lineCount = 1,
  });

  TextCardState copyWith({
    String? text,
    int? lineCount,
  }) {
    return TextCardState(
      text: text ?? this.text,
      lineCount: lineCount ?? this.lineCount,
    );
  }
}
