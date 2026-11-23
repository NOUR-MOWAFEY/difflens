import 'package:difflens/cubits/diff_card_cubit.dart';
import 'package:difflens/cubits/diff_option.dart';
import 'package:difflens/widgets/auto_close_on_wide_screen.dart';
import 'package:difflens/widgets/custom_dropdown_menu.dart';
import 'package:difflens/widgets/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileDiffCardHeader extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            'Changes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          Spacer(),

          OptionsMenu(),
          StatsBottomSheetButton(),
        ],
      ),
    );
  }
}

class StatsBottomSheetButton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final cubit = context.read<DiffCardCubit>();
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,

          builder: (context) => AutoCloseOnWideScreen(
            child: BlocProvider.value(
              value: cubit,
              child: const StatsCard(
                padding: EdgeInsets.all(16),
                isMobileLayout: true,
              ),
            ),
          ),
        );
      },
      icon: const Icon(Icons.bar_chart_rounded),
    );
  }
}

class OptionsMenu extends StatelessWidget {
  const OptionsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DiffCardCubit>();
    final s = context.select((DiffCardCubit c) => c.state);
    final active = DiffOption.values.where((o) => o.isOn(s)).length;

    return AppMenu(
      icon: Icons.tune_rounded,
      label: active == 0 ? 'Options' : 'Options ($active)',
      children: [
        for (final o in DiffOption.values)
          AppMenuItem(
            label: o.label,
            selected: o.isOn(s),
            onPressed: () => o.toggle(cubit),
          ),
      ],
    );
  }
}
