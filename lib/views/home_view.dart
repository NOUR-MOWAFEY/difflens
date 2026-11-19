// import 'package:difflens/widgets/text_card.dart';
import 'package:difflens/cubits/text_card_cubit.dart';
import 'package:difflens/widgets/text_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TextCardCubit oldTextCubit;
  late final TextCardCubit newTextCubit;

  @override
  void initState() {
    super.initState();
    oldTextCubit = TextCardCubit();
    newTextCubit = TextCardCubit();
  }

  @override
  void dispose() {
    oldTextCubit.close();
    newTextCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
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
    );
  }
}
