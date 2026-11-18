import 'package:flutter/material.dart';

class CustomToggleButton extends StatelessWidget {
  final String label;
  final Widget? leading;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomToggleButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected
            ? const Color(0xFF2A2E37)
            : const Color(0xFF16181D),
        foregroundColor: isSelected ? Colors.white : const Color(0xFF9AA0A6),
        side: BorderSide(
          color: isSelected ? const Color(0xFF5F6368) : const Color(0xFF2C3038),
          width: 1,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            IconTheme(
              data: IconThemeData(
                size: 15,
                color: isSelected ? Colors.white : const Color(0xFF7D8590),
              ),
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : const Color(0xFF7D8590),
                ),
                child: leading!,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
