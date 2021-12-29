import 'package:flutter/material.dart';

class PercentageCalculateModel extends ChangeNotifier {
  TextEditingController? numberController;
  TextEditingController? percentageController;

  void calculatePercent() {
    notifyListeners();
  }

  void modulus() {
    notifyListeners();
  }

  void negate() {
    notifyListeners();
  }
}
