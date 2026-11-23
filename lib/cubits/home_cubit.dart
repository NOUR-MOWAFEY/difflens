import 'dart:async';
import 'package:difflens/cubits/diff_card_cubit.dart';
import 'package:difflens/cubits/home_state.dart';
import 'package:difflens/cubits/text_card_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final TextCardCubit oldTextCubit;
  final TextCardCubit newTextCubit;
  final DiffCardCubit diffCardCubit;
  late final StreamSubscription _oldSub;
  late final StreamSubscription _newSub;

  HomeCubit({
    TextCardCubit? oldTextCubit,
    TextCardCubit? newTextCubit,
    DiffCardCubit? diffCardCubit,
  })  : oldTextCubit = oldTextCubit ?? TextCardCubit(),
        newTextCubit = newTextCubit ?? TextCardCubit(),
        diffCardCubit = diffCardCubit ?? DiffCardCubit(),
        super(const HomeInitial()) {
    this.diffCardCubit.updateTexts(
      oldText: this.oldTextCubit.state.text,
      newText: this.newTextCubit.state.text,
    );

    _oldSub = this.oldTextCubit.stream.listen((state) {
      this.diffCardCubit.updateOldText(state.text);
    });
    _newSub = this.newTextCubit.stream.listen((state) {
      this.diffCardCubit.updateNewText(state.text);
    });
  }

  void swapTexts() {
    final oldText = oldTextCubit.state.text;
    final newText = newTextCubit.state.text;
    oldTextCubit.controller.text = newText;
    newTextCubit.controller.text = oldText;
  }

  void clearAll() {
    oldTextCubit.clear();
    newTextCubit.clear();
  }

  @override
  Future<void> close() {
    _oldSub.cancel();
    _newSub.cancel();
    diffCardCubit.close();
    oldTextCubit.close();
    newTextCubit.close();
    return super.close();
  }
}
