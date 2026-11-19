import 'package:difflens/cubits/text_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextCardCubit extends Cubit<TextCardState> {
  final TextEditingController controller;

  TextCardCubit({TextEditingController? controller})
      : controller = controller ?? TextEditingController(),
        super(const TextCardState()) {
    this.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final text = controller.text;
    final count = text.isEmpty ? 1 : '\n'.allMatches(text).length + 1;
    emit(TextCardState(text: text, lineCount: count));
  }

  void clear() {
    controller.clear();
  }

  @override
  Future<void> close() {
    controller.removeListener(_onTextChanged);
    controller.dispose();
    return super.close();
  }
}
