import 'package:difflens/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class AutoCloseOnWideScreen extends StatefulWidget {
  final Widget child;
  final int breakpoint;

  const AutoCloseOnWideScreen({
    super.key,
    required this.child,
    this.breakpoint = AppDimensions.mobile,
  });

  @override
  State<AutoCloseOnWideScreen> createState() => _AutoCloseOnWideScreenState();
}

class _AutoCloseOnWideScreenState extends State<AutoCloseOnWideScreen> {
  bool _isClosing = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final width = MediaQuery.sizeOf(context).width;
    if (width > widget.breakpoint && !_isClosing) {
      _isClosing = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
