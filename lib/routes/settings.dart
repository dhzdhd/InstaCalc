import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/widgets/theme_settings_tile.dart';

class SettingsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text('Settings'),
        leading: NeumorphicBackButton(),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: SizedBox.expand(
            child: Neumorphic(
              style: NeumorphicStyle(
                lightSource: LightSource.topLeft,
                depth: -5,
              ),
              child: Column(
                children: [
                  ThemeSettingTile(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
