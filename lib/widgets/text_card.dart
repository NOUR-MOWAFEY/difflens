import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/widgets/text_card_body.dart';
import 'package:difflens/widgets/text_card_header.dart';
import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  const new({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),

      clipBehavior: .antiAlias,

      child: Column(
        children: [
          TextCardHeader(title: title),

          const Divider(color: AppColors.border, thickness: 1.5, height: 0),

          const TextCardBody(),
        ],
      ),
    );
  }
}
