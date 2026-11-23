
import 'package:difflens/cubits/diff_card_cubit.dart';
import 'package:difflens/cubits/diff_card_state.dart';

enum DiffOption {
  ignoreCase('Ignore case'),
  ignoreWhitespace('Ignore whitespace'),
  ignoreEmptyLines('Ignore empty lines');

  const DiffOption(this.label);
  final String label;

  bool isOn(DiffCardState s) {
    switch (this) {
      case DiffOption.ignoreCase:
        return s.ignoreCase;
      case DiffOption.ignoreWhitespace:
        return s.ignoreWhitespace;
      case DiffOption.ignoreEmptyLines:
        return s.ignoreEmptyLines;
    }
  }

  void toggle(DiffCardCubit c) {
    switch (this) {
      case DiffOption.ignoreCase:
        c.toggleIgnoreCase();
      case DiffOption.ignoreWhitespace:
        c.toggleIgnoreWhitespace();
      case DiffOption.ignoreEmptyLines:
        c.toggleIgnoreEmptyLines();
    }
  }
}