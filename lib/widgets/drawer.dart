import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/widgets/drawer_button.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Neumorphic(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: DrawerHeader(
                  child: Row(
                children: [
                  Flexible(
                    flex: 9,
                    child: Text(
                      "InstaCalc",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Flexible(
                    flex: 3,
                    child: NeumorphicCloseButton(),
                  )
                ],
              )),
            ),
            Flexible(
              flex: 10,
              child: DrawerFields(),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: CustomDrawerButton(
                text: 'History',
                icon: Icons.history,
                func: () => null,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: CustomDrawerButton(
                text: 'Help',
                icon: Icons.help,
                func: () => null,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: CustomDrawerButton(
                text: 'Settings',
                icon: Icons.settings,
                func: () => Navigator.of(context).popAndPushNamed('/settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
