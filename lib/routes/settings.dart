import 'package:flutter/material.dart';
import 'package:insta_calculator/widgets/theme_settings_tile.dart';

class SettingsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: BackButton(),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: SizedBox.expand(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(child: ThemeSettingTile()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
