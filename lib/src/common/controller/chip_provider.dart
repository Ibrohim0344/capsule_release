import 'package:flutter/material.dart';

class ChipProvider extends ChangeNotifier {
  void selectCategories(List categories, int value) {
    for (int i = 0; i < categories.length; i++) {
      i == value
          ? categories[i].isSelected = true
          : categories[i].isSelected = false;
    }
    notifyListeners();
  }
}
