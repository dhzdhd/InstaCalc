import 'package:flutter/cupertino.dart';

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
