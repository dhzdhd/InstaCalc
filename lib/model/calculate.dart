import 'dart:collection';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Parser {
  List list = [];

  Parser(this.list) {
    parseContents(this.list);
  }

  void parseContents(List list) async {

  }

}

class CalculateModel extends ChangeNotifier {
  final List<String> toBeParsed = [];

  UnmodifiableListView<String> get items => UnmodifiableListView(toBeParsed);


  void add(String value) {

  }

  void calculate() {

  }
}