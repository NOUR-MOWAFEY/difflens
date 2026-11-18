// import 'package:difflens/widgets/text_card.dart';
import 'package:difflens/widgets/diff_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Expanded(child: TextCard(title: 'Old Text')),

            //     SizedBox(width: 32),

            //     Expanded(child: TextCard(title: 'New Text')),
            //   ],
            // ),
            DiffCard(),
          ],
        ),
      ),
    );
  }
}
