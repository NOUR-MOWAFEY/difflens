import 'package:difflens/cubits/home_cubit.dart';
import 'package:difflens/widgets/text_card.dart';
import 'package:flutter/material.dart';

class MobileInputSection extends StatelessWidget {
  const new({super.key, required this.cubit});
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: TextCard(title: 'Old Text', cubit: cubit.oldTextCubit),
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: 300,
          child: TextCard(title: 'New Text', cubit: cubit.newTextCubit),
        ),
      ],
    );
  }
}
