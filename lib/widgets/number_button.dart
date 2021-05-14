
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/calculate.dart';

class NumberButton extends StatelessWidget {
  static const top = Color.fromARGB(242, 41, 53, 79);
  static const bottom = Color.fromARGB(255, 29, 39, 59);
  static const splash = Color.fromARGB(255, 23, 38, 38);

  final String text;
  final String val;
  final topGradient;
  final bottomGradient;
  final splashColor;
  final String choice;
  final String secChoice;

  NumberButton(
    this.text,
    this.val,
    {
      this.topGradient = top,
      this.bottomGradient = bottom,
      this.splashColor = splash,
      this.choice = 'add',
      this.secChoice = 'pass'
    }
  );

  @override
  Widget build(BuildContext context) {
    double getFontSize() {
      if (MediaQuery.of(context).size.width < 1000) {
        return MediaQuery
            .of(context)
            .size
            .width / 10;
      } else if (MediaQuery.of(context).size.width < 2000) {
        return MediaQuery
            .of(context)
            .size
            .width / 20;
      } else {
        return MediaQuery
            .of(context)
            .size
            .width / 30;
      }
    }

    final borderSize = MediaQuery.of(context).size.width / 2;

    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        borderRadius: BorderRadius.circular(borderSize),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderSize),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  this.topGradient,
                  this.bottomGradient
                ]
              ),
            ),
          child: InkWell(
            borderRadius: BorderRadius.circular(borderSize),
            splashColor: this.splashColor,
            onTap: () {
              if (this.choice == 'add') {
                Provider.of<CalculateModel>(context, listen: false).add(
                    this.val);
              } else if (this.choice == 'cls') {
                Provider.of<CalculateModel>(context, listen: false).clear();
              } else if (this.choice == 'equal'){
                Provider.of<CalculateModel>(context, listen: false).calculate();
              }
            },
            onLongPress: () {
              if (this.secChoice == 'cls') {
                Provider.of<CalculateModel>(context, listen: false).clear();
                Provider.of<CalculateModel>(context, listen: false).clearTop();
              } else {
                print('');
              }
            },
            child: Container(
              padding: EdgeInsets.all(12),
              child: Center(
                child: Text(
                  this.text,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: getFontSize(),
                    fontFamily: 'Sans Serif'
                  ),
                )
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderSize),
              ),
            ),
          ),
        )
      )
    );
  }
}