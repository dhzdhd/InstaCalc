import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/calc.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:provider/provider.dart';

// class CalcButton {
//   final String text;
//   final String value;
//   final String color;
//   final String onPressed;

//   CalcButton(this.text, this.value, this.color, this.onPressed);

//   Widget buildText(BuildContext context) {
//     return Text(text);
//   }

//   String buildValue() {
//     return value;
//   }

//   String buildColor() {
//     return color;
//   }

//   String buildFunc() {
//     return onPressed;
//   }
// }

class CustomButton extends StatelessWidget {
  final text;
  final value;
  final color;
  final onPressed;
  final fontSize;

  CustomButton(
      {required this.text,
      required this.value,
      required this.color,
      required this.onPressed,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    var _size = 0.0;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (MediaQuery.of(context).size.aspectRatio > 1) {
        _size = MediaQuery.of(context).size.height / 8;
      } else {
        _size = MediaQuery.of(context).size.width / 4;
      }
      return SizedBox(
        height: 3,
        width: 3,
        child: GestureDetector(
          child: Consumer<ThemeModel>(
            builder: (context, model, child) {
              return NeumorphicButton(
                style: NeumorphicStyle(
                  color: color == 'int'
                      ? model.baseColor
                      : color == 'nonint'
                          ? model.nonIntColor
                          : model.equalColor,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: fontSize ?? 30.0,
                        color: (text == "=") ? Colors.white : null),
                  ),
                ),
                onPressed: () {
                  switch (onPressed) {
                    case 'calc':
                      {
                        Provider.of<CalculateModel>(context, listen: false)
                            .add(value);
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
                        Provider.of<CalculateModel>(context, listen: false)
                            .clear();
                        break;
                      }
                  }
                },
              );
            },
          ),
          onLongPress: () {
            if (value == 'C') {
              Provider.of<CalculateModel>(context, listen: false)
                  .clear(all: true);
            }
          },
        ),
      );
    });
  }
}
