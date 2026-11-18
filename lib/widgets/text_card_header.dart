import 'package:difflens/widgets/circular_small_icon.dart';
import 'package:difflens/widgets/lines_counter.dart';
import 'package:flutter/material.dart';

class TextCardHeader extends StatelessWidget {
  const new({super.key, required this.title});
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(width: 8),

            const LinesCounter(),

            const Spacer(),

            CircularSmallIcon(
              popupMessage: 'Copy',
              icon: Icons.copy_rounded,
              onPressed: () {},
            ),

            CircularSmallIcon(
              popupMessage: 'Clear',
              icon: Icons.clear_rounded,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
