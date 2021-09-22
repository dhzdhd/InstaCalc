import 'package:flutter/cupertino.dart';

class HistoryHeaderTile {
  final String date;
  final Color color;

  HistoryHeaderTile({required this.date, required this.color});
}

class HistoryContentTile {
  final String expr;
  final String result;
  final String date;
  final Color color;

  HistoryContentTile(
      {required this.expr,
      required this.result,
      required this.date,
      required this.color});
}
