import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:insta_calculator/widgets/calc_button.dart';
import 'package:provider/provider.dart';

List<Map<String, String>> _buttonList = [
  {'text': 'C', 'value': 'C', 'color': 'nonint', 'func': 'clear'},
  {'text': '(', 'value': '(', 'color': 'nonint', 'func': 'calc'},
  {'text': ')', 'value': ')', 'color': 'nonint', 'func': 'calc'},
  {'text': '/', 'value': '/', 'color': 'nonint', 'func': 'calc'},
  {'text': '7', 'value': '7', 'color': 'int', 'func': 'calc'},
  {'text': '8', 'value': '8', 'color': 'int', 'func': 'calc'},
  {'text': '9', 'value': '9', 'color': 'int', 'func': 'calc'},
  {'text': 'x', 'value': 'x', 'color': 'nonint', 'func': 'calc'},
  {'text': '4', 'value': '4', 'color': 'int', 'func': 'calc'},
  {'text': '5', 'value': '5', 'color': 'int', 'func': 'calc'},
  {'text': '6', 'value': '6', 'color': 'int', 'func': 'calc'},
  {'text': '-', 'value': '-', 'color': 'nonint', 'func': 'calc'},
  {'text': '1', 'value': '1', 'color': 'int', 'func': 'calc'},
  {'text': '2', 'value': '2', 'color': 'int', 'func': 'calc'},
  {'text': '3', 'value': '3', 'color': 'int', 'func': 'calc'},
  {'text': '+', 'value': '+', 'color': 'nonint', 'func': 'calc'},
  {'text': '^', 'value': '^', 'color': 'nonint', 'func': 'calc'},
  {'text': '0', 'value': '0', 'color': 'int', 'func': 'calc'},
  {'text': '.', 'value': '.', 'color': 'nonint', 'func': 'calc'},
  {'text': '=', 'value': '=', 'color': 'equal', 'func': 'equate'},
];

final items = List<CalcButton>.generate(20, (index) {
  final item = _buttonList[index];
  return CalcButton(item['text'] as String, item['value'] as String,
      item['color'] as String, item['func'] as String);
});

class ButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(width);

    return Container(
      child: Consumer<ThemeModel>(builder: (context, model, child) {
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 20,
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return CustomButton(
                text: items[index].text,
                value: items[index].value,
                color: items[index].color,
                onPressed: items[index].buildFunc());
          },
        );
      }),

      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         CustomButton(
      //             text: 'C', color: ThemeModel.nonIntColor, onPressed: 'clear'),
      //         CustomButton(
      //             text: '(', color: ThemeModel.nonIntColor, onPressed: 'calc'),
      //         CustomButton(
      //             text: ')', color: ThemeModel.nonIntColor, onPressed: 'calc'),
      //         CustomButton(
      //             text: '/', color: ThemeModel.nonIntColor, onPressed: 'calc'),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         CustomButton(text: '7', color: null, onPressed: 'calc'),
      //         CustomButton(text: '8', color: null, onPressed: 'calc'),
      //         CustomButton(text: '9', color: null, onPressed: 'calc'),
      //         CustomButton(
      //             text: 'x', color: ThemeModel.nonIntColor, onPressed: 'calc'),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         CustomButton(text: '4', color: null, onPressed: 'calc'),
      //         CustomButton(text: '5', color: null, onPressed: 'calc'),
      //         CustomButton(text: '6', color: null, onPressed: 'calc'),
      //         CustomButton(
      //             text: '-', color: ThemeModel.nonIntColor, onPressed: 'calc'),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         CustomButton(text: '1', color: null, onPressed: 'calc'),
      //         CustomButton(text: '2', color: null, onPressed: 'calc'),
      //         CustomButton(text: '3', color: null, onPressed: 'calc'),
      //         CustomButton(
      //             text: '+', color: ThemeModel.nonIntColor, onPressed: 'calc'),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         CustomButton(
      //             text: '^', color: ThemeModel.nonIntColor, onPressed: 'calc'),
      //         CustomButton(text: '0', color: null, onPressed: 'calc'),
      //         CustomButton(
      //             text: '.', color: ThemeModel.nonIntColor, onPressed: 'calc'),
      //         CustomButton(text: '=', color: equalColor, onPressed: 'equate'),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
