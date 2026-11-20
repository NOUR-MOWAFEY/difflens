import 'package:difflens/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CircularSmallIcon extends StatelessWidget {
  const CircularSmallIcon({
    super.key,
    required this.popupMessage,
    required this.icon,
    this.onPressed,
  });
  final String popupMessage;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: popupMessage,
      waitDuration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: AppColors.smallCard,
        borderRadius: BorderRadius.circular(32),
      ),
      textStyle: const TextStyle(color: AppColors.text),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 22, color: AppColors.icon),
      ),
    );
  }
}
