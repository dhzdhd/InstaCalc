import 'package:flutter/material.dart';
import 'package:insta_calculator/routes/modes/currency/currency.dart';
import 'package:insta_calculator/routes/modes/percentage/percentage.dart';
import 'package:insta_calculator/routes/modes/scientific/scientific.dart';
import 'package:insta_calculator/routes/modes/simple/simple.dart';
import 'package:insta_calculator/routes/modes/units/units.dart';

class ModeModel extends ChangeNotifier {
  StatelessWidget currentMode = SimpleContentContainer();
  String title = 'Simple';

  ModeModel() {
    changeMode('');
  }

  String getTitle() {
    return title;
  }

  void changeMode(String mode) {
    switch (mode) {
      case 'simple':
        {
          currentMode = SimpleContentContainer();
          title = 'Simple';
          break;
        }
      case 'scientific':
        {
          currentMode = ScientificContentContainer();
          title = 'Scientific';
          break;
        }
      case 'percentage':
        {
          currentMode = PercentageContentContainer();
          title = 'Percentage';
          break;
        }
      case 'currency':
        {
          currentMode = CurrencyContentContainer();
          title = 'Currency';
          break;
        }
      case 'units':
        {
          currentMode = UnitsContentContainer();
          title = 'Units';
          break;
        }
    }
    notifyListeners();
  }
}
