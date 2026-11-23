import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/widgets/stats_card_body.dart';
import 'package:difflens/widgets/stats_card_header.dart';
import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  const new({super.key, this.padding, this.isMobileLayout = false});
  final EdgeInsets? padding;
  final bool isMobileLayout;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        mainAxisSize: isMobileLayout ? .min : .max,
        crossAxisAlignment: .start,
        children: [
          const StatsCardHeader(),

          const Divider(color: AppColors.border, thickness: 1.5, height: 0),

          Padding(
            padding:
                padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const StatsCardBody(),
          ),

          if (isMobileLayout) const SizedBox(height: 30),
        ],
      ),
    );
  }
}
