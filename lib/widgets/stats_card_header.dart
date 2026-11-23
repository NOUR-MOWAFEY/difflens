import 'package:difflens/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StatsCardHeader extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(Icons.bar_chart_rounded, color: AppColors.icon),
          SizedBox(width: 8),
          Text(
            'Diff Stats',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
