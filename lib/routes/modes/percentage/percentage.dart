import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:insta_calculator/routes/modes/common/button_list.dart';
import 'package:insta_calculator/routes/modes/common/buttons.dart';
import 'package:insta_calculator/routes/modes/common/fields.dart';
import 'package:insta_calculator/routes/modes/percentage/percentage_fields.dart';
import 'package:provider/provider.dart';

class PercentageContentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return Container(
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: PercentageFieldContainer(),
              ),
            ),
            Flexible(
              flex: 8,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CalcButtonWidget(
                  aspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
                  buttonList: ButtonList.percentageButtonList,
                  itemCount: 16,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
