import 'package:difflens/constants/stat_items.dart';
import 'package:difflens/cubits/diff_card_cubit.dart';
import 'package:difflens/cubits/diff_card_state.dart';
import 'package:difflens/widgets/similarity_progress_bar.dart';
import 'package:difflens/widgets/stat_rows_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsCardBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DiffCardCubit, DiffCardState>(
          builder: (context, state) {
            return SimilarityProgressBar(value: state.similarityPercentage);
          },
        ),

        const SizedBox(height: 16),

        const StatRowsBuilder(),
      ],
    );
  }
}

class StatRowsBuilder extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: StatItemsType.items
          .map((item) => StatRowsItem(item: item))
          .toList(),
    );
  }
}
