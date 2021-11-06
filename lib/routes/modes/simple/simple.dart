import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:insta_calculator/routes/modes/common/button_list.dart';
import 'package:insta_calculator/routes/modes/common/buttons.dart';
import 'package:insta_calculator/routes/modes/common/fields.dart';
import 'package:provider/provider.dart';

class SimpleContentContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.aspectRatio);
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return Container(
        child: Column(
          children: [
            Flexible(
              flex: 10,
              child: FieldContainer(),
            ),
            Expanded(
              flex: 31,
              child: CalcButtonWidget(
                aspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
                buttonList: ButtonList.simpleButtonList,
              ),
            ),
          ],
        ),
      );
    });
  }
}
