import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/cubits/diff_card_cubit.dart';
import 'package:difflens/widgets/diff_card_body.dart';
import 'package:difflens/widgets/diff_card_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiffCard extends StatelessWidget {
  final DiffCardCubit cubit;

  const DiffCard({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Container(
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
      ),
    );
  }
}
