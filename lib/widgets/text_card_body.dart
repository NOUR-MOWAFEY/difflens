import 'package:difflens/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextCardBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          // Line Numbers
          Container(
            width: 40,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(color: AppColors.darkCard),
            child: Column(
              children: List.generate(
                10,
                (index) => SizedBox(
                  height: 24,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Text Section
          const Expanded(
            child: TextField(
              maxLines: null,
              expands: true,
              cursorColor: AppColors.cursor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter text...',
                hintStyle: TextStyle(color: AppColors.hintText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
