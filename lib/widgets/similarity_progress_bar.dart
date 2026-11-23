import 'package:difflens/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SimilarityProgressBar extends StatelessWidget {
  const new({super.key, required this.value});
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          crossAxisAlignment: .end,
          children: [
            const Text(
              'Similarity',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              '$value%',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: value / 100,
          color: AppColors.diffSame,
          minHeight: 6,
          borderRadius: BorderRadius.circular(12),
        ),
      ],
    );
  }
}
