import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:insta_calculator/routes/modes/simple/buttons.dart';
import 'package:insta_calculator/routes/modes/common/fields.dart';
import 'package:provider/provider.dart';

class SimpleContentContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return Container(
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FieldContainer(),
              ),
            ),
            Flexible(
              flex: 15,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ButtonContainer(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
