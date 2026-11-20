import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/widgets/diff_card_body.dart';
import 'package:difflens/widgets/diff_card_header.dart';
import 'package:flutter/material.dart';

class DiffCard extends StatelessWidget {
  const DiffCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          DiffCardHeader(),
          Divider(color: AppColors.border, thickness: 1.5, height: 0),
          DiffCardBody(),
        ],
      ),
    );
  }
}
