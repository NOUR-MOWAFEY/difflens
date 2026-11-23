import 'package:difflens/cubits/home_cubit.dart';
import 'package:difflens/widgets/text_card.dart';
import 'package:flutter/material.dart';

class DesktopInputSection extends StatelessWidget {
  const new({super.key, required this.cubit});
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextCard(title: 'Old Text', cubit: cubit.oldTextCubit),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: TextCard(title: 'New Text', cubit: cubit.newTextCubit),
        ),
      ],
    );
  }
}
