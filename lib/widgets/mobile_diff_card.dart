import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/widgets/diff_card_body.dart';
import 'package:difflens/widgets/mobile_diff_card_header.dart';
import 'package:flutter/material.dart';

class MobileDiffCard extends StatelessWidget {
  const MobileDiffCard({super.key});

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
          MobileDiffCardHeader(),
          Divider(color: AppColors.border, thickness: 1.5, height: 0),
          DiffCardBody(),
        ],
      ),
    );
  }
}
