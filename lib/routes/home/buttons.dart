import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:insta_calculator/widgets/custom_button.dart';

const equalColor = Color.fromARGB(255, 81, 81, 130);
List<List<Map<String, Object?>>> _buttonList = [
  [
    {'value': 'C', 'color': ThemeModel.nonIntColor, 'func': 'clear'},
    {'value': '(', 'color': ThemeModel.nonIntColor, 'func': 'calc'},
    {'value': ')', 'color': ThemeModel.nonIntColor, 'func': 'calc'},
    {'value': '/', 'color': ThemeModel.nonIntColor, 'func': 'calc'},
  ],
  [
    {'value': '7', 'color': null, 'func': 'calc'},
    {'value': '8', 'color': null, 'func': 'calc'},
    {'value': '9', 'color': null, 'func': 'calc'},
    {'value': 'x', 'color': ThemeModel.nonIntColor, 'func': 'calc'},
  ],
  [
    {'value': '4', 'color': null, 'func': 'calc'},
    {'value': '5', 'color': null, 'func': 'calc'},
    {'value': '6', 'color': null, 'func': 'calc'},
    {'value': '-', 'color': ThemeModel.nonIntColor, 'func': 'calc'},
  ],
  [
    {'value': '1', 'color': null, 'func': 'calc'},
    {'value': '2', 'color': null, 'func': 'calc'},
    {'value': '3', 'color': null, 'func': 'calc'},
    {'value': '+', 'color': ThemeModel.nonIntColor, 'func': 'calc'},
  ],
  [
    {'value': '^', 'color': ThemeModel.nonIntColor, 'func': 'calc'},
    {'value': '0', 'color': null, 'func': 'calc'},
    {'value': '.', 'color': ThemeModel.nonIntColor, 'func': 'calc'},
    {'value': '=', 'color': equalColor, 'func': 'equate'},
  ],
];

class ButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                  text: 'C', color: ThemeModel.nonIntColor, onPressed: 'clear'),
              CustomButton(
                  text: '(', color: ThemeModel.nonIntColor, onPressed: 'calc'),
              CustomButton(
                  text: ')', color: ThemeModel.nonIntColor, onPressed: 'calc'),
              CustomButton(
                  text: '/', color: ThemeModel.nonIntColor, onPressed: 'calc'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(text: '7', color: null, onPressed: 'calc'),
              CustomButton(text: '8', color: null, onPressed: 'calc'),
              CustomButton(text: '9', color: null, onPressed: 'calc'),
              CustomButton(
                  text: 'x', color: ThemeModel.nonIntColor, onPressed: 'calc'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(text: '4', color: null, onPressed: 'calc'),
              CustomButton(text: '5', color: null, onPressed: 'calc'),
              CustomButton(text: '6', color: null, onPressed: 'calc'),
              CustomButton(
                  text: '-', color: ThemeModel.nonIntColor, onPressed: 'calc'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(text: '1', color: null, onPressed: 'calc'),
              CustomButton(text: '2', color: null, onPressed: 'calc'),
              CustomButton(text: '3', color: null, onPressed: 'calc'),
              CustomButton(
                  text: '+', color: ThemeModel.nonIntColor, onPressed: 'calc'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                  text: '^', color: ThemeModel.nonIntColor, onPressed: 'calc'),
              CustomButton(text: '0', color: null, onPressed: 'calc'),
              CustomButton(
                  text: '.', color: ThemeModel.nonIntColor, onPressed: 'calc'),
              CustomButton(text: '=', color: equalColor, onPressed: 'equate'),
            ],
          ),
        ],
      ),
    );
  }
}
