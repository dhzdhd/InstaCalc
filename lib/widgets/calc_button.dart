import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/calc.dart';
import 'package:insta_calculator/models/history.dart';
import 'package:insta_calculator/models/modes.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:provider/provider.dart';

class CalcButton extends StatelessWidget {
  final text;
  final value;
  final color;
  final onPressed;
  final fontSize;

  CalcButton({
    required this.text,
    required this.value,
    required this.color,
    required this.onPressed,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Consumer<ThemeModel>(
        builder: (context, model, child) {
          return NeumorphicButton(
            style: NeumorphicStyle(
              color: color == 'int'
                  ? model.baseColor
                  : color == 'nonint'
                      ? model.secondaryColor
                      : model.equalColor,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
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
                    var result =
                        Provider.of<CalculateModel>(context, listen: false)
                            .equate();
                    var title = Provider.of<ModeModel>(context, listen: false)
                        .getTitle();
                    Provider.of<HistoryModel>(context, listen: false).store(
                        expr: result?[0], result: result?[1], type: title);

                    break;
                  }
                case 'clear':
                  {
                    Provider.of<CalculateModel>(context, listen: false).clear();
                    break;
                  }
              }
            },
          );
        },
      ),
      onLongPress: () {
        if (value == 'C') {
          Provider.of<CalculateModel>(context, listen: false).clear(all: true);
        }
      },
    );
  }
}
