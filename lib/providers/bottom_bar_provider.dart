import 'package:flutter/material.dart';

class BottomBarProvider extends ChangeNotifier {
  int selectedIndex = 0;
  BottomBarProvider(this.selectedIndex);

  void onChange(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}
