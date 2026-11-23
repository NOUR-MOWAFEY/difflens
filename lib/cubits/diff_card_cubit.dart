import 'package:difflens/controllers/diff_text_editing_controller.dart';
import 'package:difflens/cubits/diff_card_state.dart';
import 'package:difflens/models/diff_line.dart';
import 'package:difflens/utils/diff_engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiffCardCubit extends Cubit<DiffCardState> {
  final DiffTextEditingController controller;

  DiffCardCubit({DiffTextEditingController? controller})
    : controller = controller ?? DiffTextEditingController(),
      super(const DiffCardState());

  int get addedLines => state.addedLines;
  int get removedLines => state.removedLines;
  int get sameLines => state.sameLines;
  int get similarityPercentage => state.similarityPercentage;

  void updateTexts({String? oldText, String? newText}) {
    final nextOld = oldText ?? state.oldText;
    final nextNew = newText ?? state.newText;
    _compute(oldText: nextOld, newText: nextNew);
  }

  void updateOldText(String oldText) {
    updateTexts(oldText: oldText);
  }

  void updateNewText(String newText) {
    updateTexts(newText: newText);
  }

  void toggleIgnoreCase() {
    _compute(ignoreCase: !state.ignoreCase);
  }

  void toggleIgnoreWhitespace() {
    _compute(ignoreWhitespace: !state.ignoreWhitespace);
  }

  void toggleIgnoreEmptyLines() {
    _compute(ignoreEmptyLines: !state.ignoreEmptyLines);
  }

  void _compute({
    String? oldText,
    String? newText,
    bool? ignoreCase,
    bool? ignoreWhitespace,
    bool? ignoreEmptyLines,
  }) {
    final curOld = oldText ?? state.oldText;
    final curNew = newText ?? state.newText;
    final curCase = ignoreCase ?? state.ignoreCase;
    final curWs = ignoreWhitespace ?? state.ignoreWhitespace;
    final curEmpty = ignoreEmptyLines ?? state.ignoreEmptyLines;

    final lines = DiffEngine.compute(
      oldText: curOld,
      newText: curNew,
      ignoreCase: curCase,
      ignoreWhitespace: curWs,
      ignoreEmptyLines: curEmpty,
    );

    int addedCount = 0;
    int removedCount = 0;
    int sameCount = 0;

    for (final line in lines) {
      switch (line.type) {
        case DiffType.added:
          addedCount++;
          break;
        case DiffType.deleted:
          removedCount++;
          break;
        case DiffType.same:
          sameCount++;
          break;
      }
    }

    int similarity = 100;
    final totalCompared = (sameCount * 2) + addedCount + removedCount;
    if (totalCompared > 0) {
      similarity = (((2 * sameCount) / totalCompared) * 100).round();
    } else {
      similarity = (curOld.isEmpty && curNew.isEmpty) ? 100 : 0;
    }

    final diffText = lines.map((l) => l.formattedText).join('\n');
    controller.lines = lines;
    controller.text = diffText;

    emit(
      state.copyWith(
        oldText: curOld,
        newText: curNew,
        ignoreCase: curCase,
        ignoreWhitespace: curWs,
        ignoreEmptyLines: curEmpty,
        lines: lines,
        diffText: diffText,
        addedLines: addedCount,
        removedLines: removedCount,
        sameLines: sameCount,
        similarityPercentage: similarity,
      ),
    );
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
