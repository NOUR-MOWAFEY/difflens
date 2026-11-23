import 'package:difflens/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.desktopLayout,
  });
  final WidgetBuilder mobileLayout, desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < AppDimensions.mobile) {
          return mobileLayout(context);
        }
        return desktopLayout(context);
      },
    );
  }
}
