import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/constants/editor_constants.dart';
import 'package:difflens/cubits/diff_card_cubit.dart';
import 'package:difflens/models/diff_line.dart';
import 'package:difflens/widgets/custom_text_field.dart';
import 'package:difflens/widgets/line_numbers_gutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiffCardBody extends StatefulWidget {
  const DiffCardBody({super.key});

  @override
  State<DiffCardBody> createState() => _DiffCardBodyState();
}

class _DiffCardBodyState extends State<DiffCardBody> {
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
    final cubit = context.watch<DiffCardCubit>();
    final state = cubit.state;

    return Expanded(
      child: Row(
        children: [
          LineNumbersGutter(
            textFieldKey: _textFieldKey,
            scrollController: _scrollController,
            text: state.diffText,
            lineNumberBuilder: (i) {
              if (i < state.lines.length && state.lines[i].oldLineNumber != null) {
                return '${state.lines[i].oldLineNumber}';
              }
              return '';
            },
            lineNumberColorBuilder: (i) {
              if (i < state.lines.length && state.lines[i].type == DiffType.deleted) {
                return AppColors.diffDeleted;
              }
              return null;
            },
          ),

          Container(width: 1, color: AppColors.border),

          LineNumbersGutter(
            textFieldKey: _textFieldKey,
            scrollController: _scrollController,
            text: state.diffText,
            lineNumberBuilder: (i) {
              if (i < state.lines.length && state.lines[i].newLineNumber != null) {
                return '${state.lines[i].newLineNumber}';
              }
              return '';
            },
            lineNumberColorBuilder: (i) {
              if (i < state.lines.length && state.lines[i].type == DiffType.added) {
                return AppColors.diffAdded;
              }
              return null;
            },
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
