import 'package:difflens/cubits/diff_card_cubit.dart';
import 'package:difflens/cubits/diff_card_state.dart';
import 'package:difflens/models/stat_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatRowsItem extends StatelessWidget {
  const new({super.key, required this.item});
  final StatItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: item.bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(item.icon, size: 22, color: item.color),
          const SizedBox(width: 4),
          Text(item.title),
          const Spacer(),
          BlocBuilder<DiffCardCubit, DiffCardState>(
            builder: (context, state) => Text(item.getValue(state)),
          ),
        ],
      ),
    );
  }
}
