import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/cubits/diff_card_cubit.dart';
import 'package:difflens/widgets/custom_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopDiffCardHeader extends StatelessWidget {
  const DesktopDiffCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DiffCardCubit>();
    final state = cubit.state;

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(color: AppColors.darkCard),
      child: Row(
        children: [
          const Text(
            'Changes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const Spacer(),

          CustomToggleButton(
            label: 'Ignore case',
            isSelected: state.ignoreCase,
            onPressed: cubit.toggleIgnoreCase,
          ),
          const SizedBox(width: 8),
          CustomToggleButton(
            label: 'Ignore whitespace',
            isSelected: state.ignoreWhitespace,
            onPressed: cubit.toggleIgnoreWhitespace,
          ),
          const SizedBox(width: 8),
          CustomToggleButton(
            label: 'Ignore empty lines',
            isSelected: state.ignoreEmptyLines,
            onPressed: cubit.toggleIgnoreEmptyLines,
          ),
        ],
      ),
    );
  }
}
