import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:insta_calculator/routes/modes/common/button_list.dart';
import 'package:insta_calculator/widgets/calc_button.dart';
import 'package:provider/provider.dart';

class SimpleButtonContainer extends StatelessWidget {
  final aspectRatio;
  final buttonList;
  final itemCount;
  late final items;

  SimpleButtonContainer({
    required this.aspectRatio,
    required this.buttonList,
    this.itemCount,
  }) {
    // items = List<CalcButton>.generate(20, (index) {
    //   final item = buttonList[index];
    //   return CalcButton(
    //     item['text'] as String,
    //     item['value'] as String,
    //     item['color'] as String,
    //     item['func'] as String,
    //   );
    // });
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
          itemCount: itemCount ?? 20,
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return CustomButton(
                text: buttonList[index]['text'],
                value: buttonList[index]['value'],
                color: buttonList[index]['color'],
                onPressed: buttonList[index]['func'],
                fontSize: buttonList[index]['font']);
          },
        );
      }),
    );
  }
}
