import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:insta_calculator/widgets/calc_button.dart';
import 'package:provider/provider.dart';

class CalcButtonWidget extends StatelessWidget {
  final aspectRatio;
  final buttonList;
  final itemCount;
  late final items;

  CalcButtonWidget({
    required this.aspectRatio,
    required this.buttonList,
    this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ThemeModel>(builder: (context, model, child) {
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: aspectRatio,
            crossAxisCount: 4,
            mainAxisSpacing: MediaQuery.of(context).size.height / 52,
            crossAxisSpacing: 10,
          ),
          itemCount: itemCount ?? 20,
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return CalcButton(
              text: buttonList[index]['text'],
              value: buttonList[index]['value'],
              color: buttonList[index]['color'],
              onPressed: buttonList[index]['func'],
              fontSize: buttonList[index]['font'],
            );
          },
        );
      }),
    );
  }
}
