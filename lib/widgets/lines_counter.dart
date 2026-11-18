import 'package:difflens/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LinesCounter extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.smallCard,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),

      child: Text('2 Lines'),
    );
  }
}
