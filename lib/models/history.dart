import 'package:flutter/material.dart';
import 'package:insta_calculator/backend/database.dart';

class HistoryModel extends ChangeNotifier {
  var historyItemList = [];

  HistoryModel() {
    historyItemList = DatabaseController.historyList;
  }

  Future<void> clear() async {
    await DatabaseController.delete();
    historyItemList = [];
    notifyListeners();
  }

  void fetch() {}

  Future<void> store(
      {required String expr,
      required String result,
      required String type}) async {
    await DatabaseController.insert(expr: expr, res: result, type: type);

    historyItemList = await DatabaseController.fetch();

    notifyListeners();
  }
}
