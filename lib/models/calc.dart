import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateModel extends ChangeNotifier {
  static var topText = '';
  static var bottomText = '';

  String evaluate(String expr) {
    if (expr == '') return '';

    expr = expr.replaceAll('x', '*');

    double eval = 0;
    Parser p = Parser();
    ContextModel cm = ContextModel();

    try {
      Expression exp = p.parse(expr);
      eval = exp.evaluate(EvaluationType.REAL, cm);
    } on RangeError catch (_) {
      return 'Invalid expression';
    }

    String answer = eval.toString();
    return answer == 'Infinity'
        ? answer
        : answer.substring(0, answer.length - 2);
  }

  void calculate(String char) {
    bottomText += char;

    if (char.contains(RegExp('[0-9]'))) {
      final answer = evaluate(bottomText);
      topText = answer;
    }

    notifyListeners();
  }

  void clear({bool all = false}) {
    if (all) {
      topText = '';
      bottomText = '';
    } else {
      if (bottomText != '') {
        bottomText = bottomText.substring(0, bottomText.length - 1);

        if (bottomText.length == 0) {
          return clear(all: true);
        }
        if (bottomText[bottomText.length - 1].contains(RegExp('[0-9]'))) {
          final answer = evaluate(bottomText);
          topText = answer;
        }
      }
    }

    notifyListeners();
  }

  void equate() {
    final answer = evaluate(bottomText);

    if (answer == 'Invalid expression' || answer == 'Infinity') {
      return;
    }
    bottomText = answer;
    topText = '';

    notifyListeners();
  }
}
