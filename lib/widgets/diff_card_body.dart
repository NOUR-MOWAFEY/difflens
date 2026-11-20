import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/constants/editor_constants.dart';
import 'package:difflens/widgets/custom_text_field.dart';
import 'package:difflens/widgets/line_numbers_gutter.dart';
import 'package:flutter/material.dart';

class DiffCardBody extends StatefulWidget {
  const DiffCardBody({super.key});

  @override
  State<DiffCardBody> createState() => _DiffCardBodyState();
}

class _DiffCardBodyState extends State<DiffCardBody> {
  late final TextEditingController _controller;
  late final ScrollController _scrollController;
  final GlobalKey _textFieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _scrollController = ScrollController();

    _controller.addListener(_onChanged);
    _scrollController.addListener(_onChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() {});
    });
  }

  void _onChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onChanged);
    _controller.removeListener(_onChanged);
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          LineNumbersGutter(
            textFieldKey: _textFieldKey,
            scrollController: _scrollController,
            text: _controller.text,
          ),

          Container(width: 1, color: AppColors.border),

          LineNumbersGutter(
            textFieldKey: _textFieldKey,
            scrollController: _scrollController,
            text: _controller.text,
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: EditorConstants.verticalPadding,
              ),
              child: CustomTextField(
                key: _textFieldKey,
                controller: _controller,
                scrollController: _scrollController,
                readOnly: true,
                hintText: 'Differences will appear here...',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
