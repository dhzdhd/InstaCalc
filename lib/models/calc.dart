import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateModel extends ChangeNotifier {
  static var topText = '';
  static var bottomText = '';

  String eval(String expr) {
    expr = expr.replaceAll('x', '*');
    expr = expr.replaceAll('^', '**');

    Parser p = Parser();
    Expression exp = p.parse(expr);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    return eval.toString();
  }

  void calculate(String char) {
    bottomText += char;

    if (char.contains(RegExp('[0-9]'))) {
      final answer = eval(bottomText);
      topText = answer;
    }

    notifyListeners();
  }

  void clear({bool all = false}) {
    if (all) {
      topText = '';
      bottomText = '';
    } else {
      bottomText = bottomText.substring(0, bottomText.length - 1);

      if (bottomText[bottomText.length - 1].contains(RegExp('[0-9]'))) {
        final answer = eval(bottomText);
        topText = answer;
      }
    }

    notifyListeners();
  }

  void equate() {
    final answer = eval(bottomText);
    bottomText = answer;
    topText = '';

    notifyListeners();
  }
}
