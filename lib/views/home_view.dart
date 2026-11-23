import 'package:difflens/cubits/home_cubit.dart';
import 'package:difflens/widgets/adaptive_layout.dart';
import 'package:difflens/widgets/desktop_home_view_body.dart';
import 'package:difflens/widgets/mobile_home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Scaffold(
        body: AdaptiveLayout(
          desktopLayout: (_) => const DesktopHomeViewBody(),
          mobileLayout: (_) => const MobileHomeViewBody(),
        ),
      ),
    );
  }
}
