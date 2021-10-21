import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/widgets/history_tiles.dart';

class HistoryRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'history',
      child: Scaffold(
        appBar: NeumorphicAppBar(
          leading: NeumorphicBackButton(),
          title: Text('History'),
        ),
        body: HistoryBody(),
      ),
    );
  }
}

class HistoryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Neumorphic(
          style: NeumorphicStyle(
            depth: -5,
          ),
          child: ListView(
            reverse: true,
            children: [
              HistoryTile(
                date: '24/9/2021',
                children: [
                  HistoryContentTile(
                      heading: 'Simple', expr: '1234x1', result: '1234'),
                  HistoryContentTile(
                      heading: 'Simple', expr: '1234x1', result: '1234'),
                  HistoryContentTile(
                      heading: 'Simple', expr: '1234x1', result: '1234'),
                ],
              ),
              HistoryTile(
                date: '25/9/2021',
                children: [
                  HistoryContentTile(
                      heading: 'Simple', expr: '1234x1', result: '1234'),
                  HistoryContentTile(
                      heading: 'Simple', expr: '1234x1', result: '1234'),
                  HistoryContentTile(
                      heading: 'Simple', expr: '1234x1', result: '1234'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
