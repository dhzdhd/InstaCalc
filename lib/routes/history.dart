import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
            children: [],
          ),
        ),
      ),
    );
  }
}
