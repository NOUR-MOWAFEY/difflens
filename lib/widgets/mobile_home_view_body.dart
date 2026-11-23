import 'package:difflens/cubits/home_cubit.dart';
import 'package:difflens/widgets/mobile_diff_card.dart';
import 'package:difflens/widgets/mobile_input_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileHomeViewBody extends StatelessWidget {
  const MobileHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            MobileInputSection(cubit: cubit),

            const SizedBox(height: 12),

            SizedBox(
              height: 400,
              child: BlocProvider.value(
                value: cubit.diffCardCubit,
                child: const MobileDiffCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
