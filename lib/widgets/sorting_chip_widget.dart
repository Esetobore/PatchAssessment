import 'package:flutter/material.dart';
import 'package:patch_assessment/constants/app_constants.dart';

Widget buildSortChip(
    String label,
    bool isCurrentSort,
    Function(bool) onSortChanged) {
  return ChoiceChip(
    label: Text(
      label,
      style: const TextStyle(color: Colors.white),
    ),
    selected: isCurrentSort,
    onSelected: (bool selected) {
      onSortChanged(selected);
    },
    selectedColor: kColorPallet1,
    backgroundColor: kColorPallet3,
  );
}
