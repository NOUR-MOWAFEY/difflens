import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toastification/toastification.dart';

class ShowToastification {
  static void _dismissCurrent() {
    toastification.dismissAll(delayForAnimation: true);
  }

  static ToastificationItem failure(BuildContext context, String text) {
    _dismissCurrent();

    return toastification.show(
      alignment: Alignment.topCenter,
      icon: const FaIcon(
        FontAwesomeIcons.circleExclamation,
        color: Colors.white,
      ),
      foregroundColor: Colors.white,
      backgroundColor: Colors.red,
      borderSide: const BorderSide(color: Colors.transparent),
      context: context,
      title: Text(text),
      autoCloseDuration: const Duration(seconds: 5),
      pauseOnHover: true,
      applyBlurEffect: true,
      closeOnClick: true,
    );
  }

  static ToastificationItem success(BuildContext context, String text) {
    _dismissCurrent();

    return toastification.show(
      alignment: Alignment.topCenter,
      icon: const FaIcon(FontAwesomeIcons.circleCheck, color: Colors.white),
      foregroundColor: Colors.white,
      backgroundColor: Colors.green,
      borderSide: const BorderSide(color: Colors.transparent),
      context: context,
      title: Text(text),
      autoCloseDuration: const Duration(seconds: 3),
      pauseOnHover: true,
      applyBlurEffect: true,
      closeOnClick: true,
    );
  }

  static ToastificationItem warning(BuildContext context, String text) {
    _dismissCurrent();

    return toastification.show(
      alignment: Alignment.topCenter,
      icon: const FaIcon(
        FontAwesomeIcons.circleExclamation,
        color: Colors.white,
      ),
      foregroundColor: Colors.white,
      backgroundColor: Colors.orangeAccent,
      borderSide: const BorderSide(color: Colors.orangeAccent),
      context: context,
      title: Text(text),
      autoCloseDuration: const Duration(seconds: 5),
      pauseOnHover: true,
      applyBlurEffect: true,
      closeOnClick: true,
    );
  }

  static ToastificationItem popUp(
    BuildContext context,
    String text, [
    Color? bgColor,
  ]) {
    _dismissCurrent();

    return toastification.show(
      closeOnClick: true,
      closeButton: const ToastCloseButton(showType: CloseButtonShowType.none),
      padding: const EdgeInsets.only(left: 14, right: 10, top: 8, bottom: 8),
      style: ToastificationStyle.simple,
      alignment: Alignment.topLeft,
      foregroundColor: Colors.white,
      backgroundColor: bgColor ?? Colors.black45,
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(32),
      context: context,
      title: Text(text),
      autoCloseDuration: const Duration(seconds: 2),
      pauseOnHover: true,
      applyBlurEffect: true,
    );
  }

  /// Displays a small popup bubble directly on top of the target widget (e.g. icon button)
  static void showOnWidget(
    BuildContext context,
    String text, [
    Color? bgColor,
  ]) {
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.hasSize) return;

    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    final screenSize = MediaQuery.of(context).size;

    // Show above the icon if there's room, otherwise below
    final double top = (offset.dy - 36 >= 10)
        ? offset.dy - 36
        : offset.dy + size.height + 6;

    // Center horizontally over the icon and clamp to screen bounds
    final double left = (offset.dx + (size.width / 2) - 45).clamp(
      10.0,
      screenSize.width - 100.0,
    );

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned(
            left: left,
            top: top,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: bgColor ?? const Color(0xff3F5272),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}
