import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/widgets/custom_toggle_button.dart';
import 'package:flutter/material.dart';

class DiffCardHeader extends StatelessWidget {
  const DiffCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(color: AppColors.darkCard),
      child: Row(
        children: [
          CustomToggleButton(
            label: 'Ignore case',
            isSelected: false,
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          CustomToggleButton(
            label: 'Ignore whitespace',
            isSelected: false,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
