import 'package:difflens/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({
    super.key,
    required this.label,
    required this.icon,
    required this.children,
  });

  final String label;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.popup),
        surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: AppColors.border),
          ),
        ),
      ),
      builder: (context, controller, _) => IconButton(
        onPressed: () =>
            controller.isOpen ? controller.close() : controller.open(),
        icon: Icon(Icons.filter_list_rounded),
      ),
      menuChildren: children,
    );
  }
}

class AppMenuItem extends StatelessWidget {
  const AppMenuItem({
    super.key,
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  final String label;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
      closeOnActivate: false,
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColors.text),
        minimumSize: const WidgetStatePropertyAll(Size(0, 44)),
      ),
      leadingIcon: Icon(
        selected
            ? Icons.check_box_rounded
            : Icons.check_box_outline_blank_rounded,
        size: 20,
        color: selected ? AppColors.checkActive : AppColors.checkInactive,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
