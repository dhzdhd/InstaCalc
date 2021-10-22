import 'package:flutter/material.dart';
import 'package:insta_calculator/routes/modes/currency/currency.dart';
import 'package:insta_calculator/routes/modes/number/number.dart';
import 'package:insta_calculator/routes/modes/percentage/percentage.dart';
import 'package:insta_calculator/routes/modes/scientific/scientific.dart';
import 'package:insta_calculator/routes/modes/sigdigits/sigdigits.dart';
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
      case 'number':
        {
          currentMode = NumberContentContainer();
          title = 'Number System';
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
      case 'sigdigit':
        {
          currentMode = SignificantDigitContentContainer();
          title = 'Significant Digit';
          break;
        }
    }
    notifyListeners();
  }
}
