import 'package:flutter/cupertino.dart';

class HistoryModel extends ChangeNotifier {
  static var historyItemList = [];

  HistoryModel() {
    historyItemList.addAll([]); // Storage stuff here
  }

  void clear() {
    historyItemList.clear();
    notifyListeners();
  }
}
