import 'package:flutter/material.dart';

class HelpProvider extends ChangeNotifier {
  List<bool> isCollapsed = List.generate(6, (index) => true);

  void onExpansionChanged(int index) {
    for (int i = 0; i < isCollapsed.length; i++) {
      if (i == index) isCollapsed[index] = !isCollapsed[index];
    }
    notifyListeners();
  }
}
