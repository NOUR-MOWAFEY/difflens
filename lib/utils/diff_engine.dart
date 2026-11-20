import 'dart:math';
import 'dart:typed_data';
import 'package:difflens/models/diff_line.dart';

class _LineEntry {
  final int index;
  final String text;

  const _LineEntry(this.index, this.text);
}

class DiffEngine {
  static List<DiffLine> compute({
    required String oldText,
    required String newText,
    bool ignoreCase = false,
    bool ignoreWhitespace = false,
    bool ignoreEmptyLines = false,
  }) {
    if (oldText.isEmpty && newText.isEmpty) {
      return const [];
    }

    final allOld = oldText.isEmpty ? <String>[] : oldText.split('\n');
    final allNew = newText.isEmpty ? <String>[] : newText.split('\n');

    var oldLines = List.generate(
      allOld.length,
      (i) => _LineEntry(i + 1, allOld[i]),
    );
    var newLines = List.generate(
      allNew.length,
      (i) => _LineEntry(i + 1, allNew[i]),
    );

    if (ignoreEmptyLines) {
      oldLines = oldLines.where((e) => e.text.trim().isNotEmpty).toList();
      newLines = newLines.where((e) => e.text.trim().isNotEmpty).toList();
    }

    final m = oldLines.length;
    final n = newLines.length;

    if (m == 0 && n == 0) {
      return const [];
    }

    if (m == 0) {
      return List.generate(
        n,
        (i) => DiffLine(
          oldLineNumber: null,
          newLineNumber: newLines[i].index,
          text: newLines[i].text,
          type: DiffType.added,
        ),
      );
    }

    if (n == 0) {
      return List.generate(
        m,
        (i) => DiffLine(
          oldLineNumber: oldLines[i].index,
          newLineNumber: null,
          text: oldLines[i].text,
          type: DiffType.deleted,
        ),
      );
    }

    // Dynamic programming table for Longest Common Subsequence (LCS)
    final dp = List.generate(m + 1, (_) => Int32List(n + 1));

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (_linesEqual(oldLines[i].text, newLines[j].text, ignoreCase, ignoreWhitespace)) {
          dp[i + 1][j + 1] = dp[i][j] + 1;
        } else {
          dp[i + 1][j + 1] = max(dp[i + 1][j], dp[i][j + 1]);
        }
      }
    }

    // Backtrack to assemble diff lines
    int i = m;
    int j = n;
    final reversed = <DiffLine>[];

    while (i > 0 || j > 0) {
      if (i > 0 &&
          j > 0 &&
          _linesEqual(oldLines[i - 1].text, newLines[j - 1].text, ignoreCase, ignoreWhitespace)) {
        reversed.add(DiffLine(
          oldLineNumber: oldLines[i - 1].index,
          newLineNumber: newLines[j - 1].index,
          text: newLines[j - 1].text,
          type: DiffType.same,
        ));
        i--;
        j--;
      } else if (j > 0 && (i == 0 || dp[i][j - 1] >= dp[i - 1][j])) {
        reversed.add(DiffLine(
          oldLineNumber: null,
          newLineNumber: newLines[j - 1].index,
          text: newLines[j - 1].text,
          type: DiffType.added,
        ));
        j--;
      } else if (i > 0 && (j == 0 || dp[i][j - 1] < dp[i - 1][j])) {
        reversed.add(DiffLine(
          oldLineNumber: oldLines[i - 1].index,
          newLineNumber: null,
          text: oldLines[i - 1].text,
          type: DiffType.deleted,
        ));
        i--;
      }
    }

    return reversed.reversed.toList();
  }

  static bool _linesEqual(
    String a,
    String b,
    bool ignoreCase,
    bool ignoreWhitespace,
  ) {
    var s1 = a;
    var s2 = b;
    if (ignoreWhitespace) {
      s1 = s1.replaceAll(RegExp(r'\s+'), '');
      s2 = s2.replaceAll(RegExp(r'\s+'), '');
    }
    if (ignoreCase) {
      s1 = s1.toLowerCase();
      s2 = s2.toLowerCase();
    }
    return s1 == s2;
  }
}
