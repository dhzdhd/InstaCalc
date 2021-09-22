import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_calculator/models/calc.dart';
import 'package:insta_calculator/models/modes.dart';
import 'package:insta_calculator/widgets/drawer_button.dart';
import 'package:insta_calculator/routes/help.dart';
import 'package:provider/provider.dart';

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
                    Expanded(
                      flex: 9,
                      child: Text(
                        "InstaCalc",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 20,
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
                ),
              ),
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
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 3),
              child: CustomDrawerButton(
                text: 'Simple',
                icon: Icons.calculate,
                func: () {
                  Navigator.of(context).pop();
                  Provider.of<CalculateModel>(context, listen: false)
                      .clear(all: true);
                  Provider.of<ModeModel>(context, listen: false)
                      .changeMode('simple');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 3),
              child: CustomDrawerButton(
                text: 'Scientific',
                icon: Icons.science,
                func: () {
                  Navigator.of(context).pop();
                  Provider.of<CalculateModel>(context, listen: false)
                      .clear(all: true);
                  Provider.of<ModeModel>(context, listen: false)
                      .changeMode('scientific');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 3),
              child: CustomDrawerButton(
                text: 'Percentage',
                icon: FontAwesomeIcons.percentage,
                func: () {
                  Navigator.of(context).pop();
                  Provider.of<CalculateModel>(context, listen: false)
                      .clear(all: true);
                  Provider.of<ModeModel>(context, listen: false)
                      .changeMode('percentage');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 3),
              child: CustomDrawerButton(
                text: 'Number system',
                icon: FontAwesomeIcons.sortNumericUp,
                func: () {
                  Navigator.of(context).pop();
                  Provider.of<CalculateModel>(context, listen: false)
                      .clear(all: true);
                  Provider.of<ModeModel>(context, listen: false)
                      .changeMode('number');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 3),
              child: CustomDrawerButton(
                text: 'Currency',
                icon: Icons.monetization_on,
                func: () {
                  Navigator.of(context).pop();
                  Provider.of<ModeModel>(context, listen: false)
                      .changeMode('currency');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: CustomDrawerButton(
                text: 'Units',
                icon: Icons.format_list_numbered,
                func: () {
                  Navigator.of(context).pop();
                  Provider.of<ModeModel>(context, listen: false)
                      .changeMode('units');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: CustomDrawerButton(
                text: 'Significant Digit',
                icon: FontAwesomeIcons.creativeCommonsZero,
                func: () {
                  Navigator.of(context).pop();
                  Provider.of<ModeModel>(context, listen: false)
                      .changeMode('sigdigit');
                },
              ),
            ),
            Divider(),
            Spacer(),
            Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: CustomDrawerButton(
                  text: 'Help',
                  icon: Icons.help,
                  func: () {
                    Navigator.of(context).pop();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return HelpDialog();
                        });
                  },
                )),
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
