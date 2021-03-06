import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class CalculateModel extends ChangeNotifier {
  var topText = '';
  var bottomText = '';

  String evaluate(String expr) {
    if (expr == '') return '';

    expr = expr.replaceAll('x', '*');

    double eval = 0;
    Parser p = Parser();
    ContextModel cm = ContextModel();

    try {
      Expression exp = p.parse(expr);
      eval = exp.evaluate(EvaluationType.REAL, cm);
    } catch (_) {
      return 'Invalid expression';
    }

    String answer = eval.toString();
    return answer == 'Infinity'
        ? answer
        : answer.endsWith('.0')
            ? answer.substring(0, answer.length - 2)
            : answer;
  }

  void add(String char) {
    bottomText += char;

    if (char.contains(RegExp('[0-9()]'))) {
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

  List? equate() {
    var result = [bottomText, topText];

    final answer = evaluate(bottomText);

    if (answer == 'Invalid expression' || answer == 'Infinity') {
      return null;
    }
    bottomText = answer;
    topText = '';

    notifyListeners();

    return result;
  }
}
