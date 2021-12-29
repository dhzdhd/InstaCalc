import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/history.dart';
import 'package:insta_calculator/widgets/animated_button.dart';
import 'package:insta_calculator/widgets/history_tiles.dart';
import 'package:provider/provider.dart';

class HistoryRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'history',
      child: Scaffold(
        appBar: NeumorphicAppBar(
          leading: NeumorphicBackButton(),
          title: Text('History'),
          actions: [
            AnimatedButtonWidget(
              child: Icon(Icons.delete_outline),
              onPressed: () async {
                await Provider.of<HistoryModel>(context, listen: false).clear();
              },
            )
          ],
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
          child: Consumer<HistoryModel>(builder: (context, model, child) {
            return ListView.builder(
              reverse: true,
              itemCount: model.historyItemList.length,
              itemBuilder: (context, index) {
                var map = model.historyItemList[index];

                var exprList = map['expr'].toString().split(' ');
                var resList = map['res'].toString().split(' ');
                var typeList = map['type'].toString().split(' ');

                return HistoryTile(
                    date: map['curdate'],
                    children: List.generate(
                        exprList.length,
                        (i) => HistoryContentTile(
                            heading: typeList[i],
                            expr: exprList[i],
                            result: resList[i])));
              },
            );
          }),
        ),
      ),
    );
  }
}
