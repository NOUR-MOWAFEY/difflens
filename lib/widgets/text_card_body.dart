import 'package:difflens/constants/editor_constants.dart';
import 'package:difflens/cubits/text_card_cubit.dart';
import 'package:difflens/widgets/custom_text_field.dart';
import 'package:difflens/widgets/line_numbers_gutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextCardBody extends StatefulWidget {
  const TextCardBody({super.key});

  @override
  State<TextCardBody> createState() => _TextCardBodyState();
}

class _TextCardBodyState extends State<TextCardBody> {
  late final ScrollController _scrollController;
  final GlobalKey _textFieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScrollChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() {});
    });
  }

  void _onScrollChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollChanged);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TextCardCubit>();

    return Expanded(
      child: Row(
        children: [
          LineNumbersGutter(
            textFieldKey: _textFieldKey,
            scrollController: _scrollController,
            text: cubit.state.text,
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: EditorConstants.verticalPadding,
              ),

              child: CustomTextField(
                key: _textFieldKey,
                controller: cubit.controller,
                scrollController: _scrollController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
