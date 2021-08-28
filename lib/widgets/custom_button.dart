import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/calc.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final text;
  final color;
  final onPressed;

  CustomButton(
      {required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var _size = 75.0;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (MediaQuery.of(context).size.aspectRatio > 1) {
        _size = MediaQuery.of(context).size.height / 8 - 30;
      } else {
        _size = MediaQuery.of(context).size.width / 4 - 20;
      }
      return SizedBox(
        height: _size,
        width: _size,
        child: GestureDetector(
          child: NeumorphicButton(
            style: NeumorphicStyle(
              color: color,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 30, color: (text == "=") ? Colors.white : null),
              ),
            ),
            onPressed: () {
              switch (onPressed) {
                case 'calc':
                  {
                    Provider.of<CalculateModel>(context, listen: false)
                        .calculate(text);
                    break;
                  }
                case 'equate':
                  {
                    Provider.of<CalculateModel>(context, listen: false)
                        .equate();
                    break;
                  }
                case 'clear':
                  {
                    Provider.of<CalculateModel>(context, listen: false).clear();
                    break;
                  }
              }
            },
          ),
          onLongPress: () {
            if (text == 'C') {
              Provider.of<CalculateModel>(context, listen: false)
                  .clear(all: true);
            }
          },
        ),
      );
    });
  }
}
