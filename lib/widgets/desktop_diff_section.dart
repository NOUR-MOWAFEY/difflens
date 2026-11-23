import 'package:difflens/widgets/diff_card.dart';
import 'package:difflens/widgets/stats_card.dart';
import 'package:flutter/material.dart';

class DesktopDiffSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 5, child: DesktopDiffCard()),

        SizedBox(width: 12),

        Expanded(flex: 2, child: StatsCard()),
      ],
    );
  }
}
