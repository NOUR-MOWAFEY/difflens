import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/constants/app_dimensions.dart';
import 'package:difflens/cubits/text_card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LinesCounter extends StatelessWidget {
  const LinesCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final lineCount = context.select<TextCardCubit, int>(
      (cubit) => cubit.state.lineCount,
    );

    return MediaQuery.widthOf(context) < AppDimensions.mobile
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.smallCard,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('$lineCount'),
          )
        : Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.smallCard,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('$lineCount Lines'),
          );
  }
}
