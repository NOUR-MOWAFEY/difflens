import 'package:difflens/cubits/home_cubit.dart';
import 'package:difflens/widgets/desktop_diff_section.dart';
import 'package:difflens/widgets/desktop_input_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopHomeViewBody extends StatelessWidget {
  const DesktopHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: DesktopInputSection(cubit: cubit)),

            const SizedBox(height: 12),

            Expanded(
              child: BlocProvider.value(
                value: cubit.diffCardCubit,
                child: const DesktopDiffSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
