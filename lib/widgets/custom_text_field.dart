import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/constants/editor_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.scrollController,
    this.hintText = 'Enter text...',
    this.readOnly = false,
  });

  final TextEditingController controller;
  final ScrollController scrollController;
  final String hintText;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      scrollController: scrollController,
      readOnly: readOnly,
      cursorHeight: 16,
      maxLines: null,
      expands: true,
      cursorColor: AppColors.cursor,
      keyboardType: TextInputType.multiline,
      style: const TextStyle(
        fontSize: EditorConstants.fontSize,
        height: EditorConstants.lineHeightMultiplier,
        color: AppColors.text,
      ),
      strutStyle: const StrutStyle(
        fontSize: EditorConstants.fontSize,
        height: EditorConstants.lineHeightMultiplier,
        forceStrutHeight: true,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.hintText),
      ),
    );
  }
}
