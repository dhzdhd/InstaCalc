import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:provider/provider.dart';

enum Theme { light, dark }

class ThemeSettingTile extends StatefulWidget {
  @override
  _ThemeSettingTileState createState() => _ThemeSettingTileState();
}

class _ThemeSettingTileState extends State<ThemeSettingTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Theme groupValue = Theme.light;
  double height = 80;
  bool visible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void expand() {
    setState(() {
      if (height == 150) {
        height = 80;
        visible = false;
      } else {
        height = 150;
        visible = true;
      }
    });
  }

  double setAngle() {
    double angle = height == 150 ? 0.5 * pi : 0;
    return angle;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: NeumorphicButton(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Flexible(flex: 1, child: Icon(Icons.palette)),
                    Spacer(flex: 3),
                    Flexible(
                      flex: 5,
                      child: Text(
                        'Theme',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Spacer(flex: 20),
                    Flexible(
                      flex: 1,
                      child: AnimatedBuilder(
                        animation: _controller,
                        child: const Icon(Icons.keyboard_arrow_right),
                        builder: (_, child) {
                          return Transform.rotate(
                            origin: Offset(5, -3),
                            angle: setAngle(),
                            child: child,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: visible,
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Spacer(),
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: NeumorphicRadio(
                            child: Icon(Icons.dark_mode),
                            groupValue: groupValue,
                            value: Theme.dark,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value as Theme;
                                Provider.of<ThemeModel>(context, listen: false)
                                    .changeTheme('dark');
                              });
                            },
                          ),
                        ),
                      ),
                      Spacer(flex: 2),
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: NeumorphicRadio(
                            child: Icon(Icons.light_mode_rounded),
                            groupValue: groupValue,
                            value: Theme.light,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value as Theme;
                                Provider.of<ThemeModel>(context, listen: false)
                                    .changeTheme('light');
                              });
                            },
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onPressed: () => expand(),
        ),
      ),
    );
  }
}
