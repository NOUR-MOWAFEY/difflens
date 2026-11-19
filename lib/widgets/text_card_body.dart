import 'package:difflens/constants/editor_constants.dart';
import 'package:difflens/widgets/custom_text_field.dart';
import 'package:difflens/widgets/line_numbers_gutter.dart';
import 'package:flutter/material.dart';

class TextCardBody extends StatefulWidget {
  const TextCardBody({super.key});

  @override
  State<TextCardBody> createState() => _TextCardBodyState();
}

class _TextCardBodyState extends State<TextCardBody> {
  late final TextEditingController _textController;
  late final ScrollController _scrollController;
  final GlobalKey _textFieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _scrollController = ScrollController();

    _textController.addListener(_onChanged);
    _scrollController.addListener(_onChanged);

    // Ensure line numbers query RenderEditable immediately after initial layout
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
    _textController.removeListener(_onChanged);
    _scrollController.dispose();
    _textController.dispose();
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
            text: _textController.text,
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: EditorConstants.verticalPadding,
              ),
              child: CustomTextField(
                key: _textFieldKey,
                controller: _textController,
                scrollController: _scrollController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
