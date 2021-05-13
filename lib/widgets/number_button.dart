import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  static const top = Color.fromARGB(242, 41, 53, 79);
  static const bottom = Color.fromARGB(255, 29, 39, 59);
  static const splash = Color.fromARGB(255, 23, 38, 38);

  final String text;
  final String val;
  final topGradient;
  final bottomGradient;
  final splashColor;

  NumberButton(
    this.text,
    this.val,
    {
      this.topGradient = top,
      this.bottomGradient = bottom,
      this.splashColor = splash
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
            onTap: () => null,
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