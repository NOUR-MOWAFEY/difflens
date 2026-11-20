import 'dart:async';

import 'package:difflens/cubits/diff_card_cubit.dart';
import 'package:difflens/cubits/text_card_cubit.dart';
import 'package:difflens/widgets/diff_card.dart';
import 'package:difflens/widgets/text_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TextCardCubit oldTextCubit;
  late final TextCardCubit newTextCubit;
  late final DiffCardCubit diffCardCubit;
  StreamSubscription? _oldSub;
  StreamSubscription? _newSub;

  @override
  void initState() {
    super.initState();
    oldTextCubit = TextCardCubit();
    newTextCubit = TextCardCubit();
    diffCardCubit = DiffCardCubit();

    diffCardCubit.updateTexts(
      oldText: oldTextCubit.state.text,
      newText: newTextCubit.state.text,
    );

    _oldSub = oldTextCubit.stream.listen((state) {
      diffCardCubit.updateOldText(state.text);
    });
    _newSub = newTextCubit.stream.listen((state) {
      diffCardCubit.updateNewText(state.text);
    });
  }

  @override
  void dispose() {
    _oldSub?.cancel();
    _newSub?.cancel();
    diffCardCubit.close();
    oldTextCubit.close();
    newTextCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextCard(title: 'Old Text', cubit: oldTextCubit),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: TextCard(title: 'New Text', cubit: newTextCubit),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Expanded(child: DiffCard(cubit: diffCardCubit)),
          ],
        ),
      ),
    );
  }
}
