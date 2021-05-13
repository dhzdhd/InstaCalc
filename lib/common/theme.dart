import 'package:flutter/material.dart';

final darkTextTheme = TextStyle(
    color: Colors.white70
);

final darkTheme = ThemeData(
  primaryColor: Color.fromARGB(255, 41, 55, 81),
  scaffoldBackgroundColor: Color.fromARGB(255, 38, 50, 74),
  textTheme: TextTheme(
    headline1: darkTextTheme,
    headline2: darkTextTheme,
    headline3: darkTextTheme,
    headline4: darkTextTheme,
    headline5: darkTextTheme,
    headline6: darkTextTheme,
    caption: darkTextTheme,
    bodyText1: darkTextTheme,
    bodyText2: darkTextTheme,
    button: darkTextTheme,
    subtitle1: darkTextTheme,
    subtitle2: darkTextTheme,
  )
);