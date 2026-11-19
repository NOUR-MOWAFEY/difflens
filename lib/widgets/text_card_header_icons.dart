import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/cubits/text_card_cubit.dart';
import 'package:difflens/utils/show_toastification.dart';
import 'package:difflens/widgets/circular_small_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextCardHeaderIcons extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Builder(
          builder: (iconContext) {
            return CircularSmallIcon(
              popupMessage: 'Copy',
              icon: Icons.copy_rounded,
              onPressed: () {
                final text = context.read<TextCardCubit>().state.text;
                if (text.isNotEmpty) {
                  Clipboard.setData(ClipboardData(text: text));
                  ShowToastification.showOnWidget(
                    iconContext,
                    'Copied',
                    AppColors.popup,
                  );
                } else {
                  ShowToastification.showOnWidget(
                    iconContext,
                    'Nothing to copy',
                    AppColors.popup,
                  );
                }
              },
            );
          },
        ),

        CircularSmallIcon(
          popupMessage: 'Clear',
          icon: Icons.clear_rounded,
          onPressed: () => context.read<TextCardCubit>().clear(),
        ),
      ],
    );
  }
}
