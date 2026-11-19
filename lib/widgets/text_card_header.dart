import 'package:difflens/widgets/lines_counter.dart';
import 'package:difflens/widgets/text_card_header_icons.dart';
import 'package:flutter/material.dart';

class TextCardHeader extends StatelessWidget {
  const TextCardHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 35,
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(width: 8),

            const LinesCounter(),

            const Spacer(),

            const TextCardHeaderIcons(),
          ],
        ),
      ),
    );
  }
}
