import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:insta_calculator/routes/modes/common/button_list.dart';
import 'package:insta_calculator/widgets/calc_button.dart';
import 'package:provider/provider.dart';

class SimpleButtonContainer extends StatelessWidget {
  final aspectRatio;
  final buttonList;
  late final items;

  SimpleButtonContainer({required this.aspectRatio, required this.buttonList}) {
    items = List<CalcButton>.generate(20, (index) {
      final item = buttonList[index];
      return CalcButton(item['text'] as String, item['value'] as String,
          item['color'] as String, item['func'] as String);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ThemeModel>(builder: (context, model, child) {
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: aspectRatio,
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
