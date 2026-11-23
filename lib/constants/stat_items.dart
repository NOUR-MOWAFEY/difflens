import 'package:difflens/constants/app_colors.dart';
import 'package:difflens/models/stat_item_model.dart';
import 'package:flutter/material.dart';

class StatItemsType {
  static List<StatItemModel> items = [
    StatItemModel(
      title: 'LCS (Same)',
      getValue: (state) => state.sameLines.toString(),
      color: AppColors.diffSame,
      bgColor: AppColors.diffSameBg,
      icon: Icons.drag_handle_rounded,
    ),
    StatItemModel(
      title: 'Added',
      getValue: (state) => state.addedLines.toString(),
      color: AppColors.diffAdded,
      bgColor: AppColors.diffAddedBg,
      icon: Icons.add_rounded,
    ),
    StatItemModel(
      title: 'Removed',
      getValue: (state) => state.removedLines.toString(),
      color: AppColors.diffDeleted,
      bgColor: AppColors.diffDeletedBg,
      icon: Icons.remove_rounded,
    ),
  ];
}
