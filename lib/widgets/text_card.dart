import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/cubits/text_card_cubit.dart';
import 'package:difflens/widgets/text_card_body.dart';
import 'package:difflens/widgets/text_card_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextCard extends StatelessWidget {
  final String title;
  final TextCardCubit cubit; // إجباري

  const TextCard({super.key, required this.title, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            TextCardHeader(title: title),
            const Divider(color: AppColors.border, thickness: 1.5, height: 0),
            const TextCardBody(),
          ],
        ),
      ),
    );
  }
}
