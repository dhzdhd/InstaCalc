import 'package:flutter/material.dart';

class ModeModel extends ChangeNotifier {
  void changeMode(String mode) {
    notifyListeners();
  }
}
