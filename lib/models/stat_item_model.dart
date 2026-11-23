import 'package:difflens/cubits/diff_card_state.dart';
import 'package:flutter/material.dart';

class StatItemModel {
  final String title;
  final Color color;
  final Color bgColor;
  final IconData icon;
  final String Function(DiffCardState state) getValue;

  StatItemModel({
    required this.title,
    required this.color,
    required this.bgColor,
    required this.icon, required this.getValue,
  });
}
