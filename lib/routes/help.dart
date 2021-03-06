import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:provider/provider.dart';

class HelpDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 60, right: 60, top: 150, bottom: 150),
      child: Consumer<ThemeModel>(
        builder: (context, model, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: model.baseColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Neumorphic(
                style: NeumorphicStyle(depth: -10),
                child: Column(
                  children: [
                    Expanded(
                        child: Text(
                      'Help',
                      style: TextStyle(fontSize: 30),
                    )),
                    Flexible(
                      child: NeumorphicButton(
                        child: Text('Understood'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
