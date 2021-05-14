import 'dart:collection';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expression_language/expression_language.dart';

class Parser {
  List list = [];

  Parser(this.list) {
    parseContents();
  }

  String parseContents() {
    try {
      var expressionGrammarDefinition = ExpressionGrammarParser({});
      var parser = expressionGrammarDefinition.build();

      var result = parser.parse(this.list.join());
      var expression = result.value as Expression;
      String value = expression.evaluate().toString();
      return value;
    } on DivideByZeroException catch(e) {
      return 'Division by zero!!';
    }
  }
}

class CalculateModel extends ChangeNotifier {
  final List<String> toBeParsed = [];
  final List<String> finalText = [];

  String parsedText = "";

  void add(String value) {
    toBeParsed.add(value);
    notifyListeners();
  }

  void calculate() {
    var instance = Parser(this.toBeParsed);
    finalText.clear();
    finalText.add(instance.parseContents());
    toBeParsed.clear();
    toBeParsed.add(finalText.join());
    notifyListeners();
  }

  void clear() {
    toBeParsed.clear();
    notifyListeners();
  }

  void clearTop() {
    finalText.clear();
    notifyListeners();
  }
}