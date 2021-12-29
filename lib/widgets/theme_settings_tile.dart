import 'dart:math';

import 'package:flutter/material.dart';
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
  late final Animation<double> _animation;
  Theme? groupValue;
  double height = 80;
  bool expand = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ElevatedButton(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(flex: 2, child: Icon(Icons.palette)),
                    Spacer(flex: 3),
                    Expanded(
                      flex: 40,
                      child: Text(
                        'Theme',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    // Spacer(flex: 20),
                    Flexible(
                      child: AnimatedBuilder(
                        animation: _controller,
                        child: const Icon(Icons.keyboard_arrow_right),
                        builder: (_, child) {
                          return Transform.rotate(
                            origin: Offset(5, -3),
                            angle: _animation.value * pi / 2,
                            child: child,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizeTransition(
                sizeFactor: _animation,
                axisAlignment: 1,
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
                          // ! Change to radio!!!
                          child: ElevatedButton(
                            child: Icon(Icons.dark_mode),
                            // groupValue: groupValue,
                            // value: Theme.dark,
                            onPressed: () async {
                              await Provider.of<ThemeModel>(context,
                                      listen: false)
                                  .changeTheme('dark');
                              setState(() {
                                // groupValue = value as Theme;
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
                          child: ElevatedButton(
                            child: Icon(Icons.light_mode_rounded),
                            // groupValue: groupValue,
                            // value: Theme.light,
                            onPressed: () async {
                              await Provider.of<ThemeModel>(context,
                                      listen: false)
                                  .changeTheme('light');
                              setState(() {
                                // groupValue = value as Theme;
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
          onPressed: () {
            setState(() {
              _controller.isDismissed
                  ? _controller.forward()
                  : _controller.reverse();
            });
          },
        ),
      ),
    );
  }
}
