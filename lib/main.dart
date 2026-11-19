import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(const ToastificationWrapper(child: DiffLens()));
}

class DiffLens extends StatelessWidget {
  const DiffLens({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.bg,
        primaryColor: AppColors.card,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.card),
      ),
      home: const HomeView(),
    );
  }
}
