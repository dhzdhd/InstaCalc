import 'package:flutter/material.dart';

class HistoryModel extends ChangeNotifier {
  static var historyItemList = [];

  void clear() {
    historyItemList.clear();
    notifyListeners();
  }

  void fetch() {}

  void store(
      {required String expr, required String result, required String type}) {}
}
