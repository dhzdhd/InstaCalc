import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/backend/storage.dart';

final lightBaseColor = Color.fromARGB(255, 235, 235, 255);
final lightTextColor = Color.fromARGB(255, 77, 77, 123);
final lightTextStyle = TextStyle(color: lightTextColor, fontFamily: 'Cairo');
final lightTheme = NeumorphicThemeData(
  baseColor: Color.fromARGB(255, 235, 235, 255),
  appBarTheme: NeumorphicAppBarThemeData(
    iconTheme: IconThemeData(color: lightTextColor),
    textStyle: TextStyle(
      color: lightTextColor,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.bold,
    ),
    buttonStyle: NeumorphicStyle(
      depth: 5,
      lightSource: LightSource.topRight,
    ),
  ),
  textTheme: TextTheme(
    headline1: lightTextStyle,
    headline2: lightTextStyle,
    headline3: lightTextStyle,
    headline4: lightTextStyle,
    headline5: lightTextStyle,
    headline6: lightTextStyle,
    subtitle1: lightTextStyle,
    subtitle2: lightTextStyle,
    bodyText1: lightTextStyle,
    bodyText2: lightTextStyle,
    caption: lightTextStyle,
    button: lightTextStyle,
    overline: lightTextStyle,
  ),
  buttonStyle: NeumorphicStyle(
    depth: 5,
    lightSource: LightSource.topRight,
  ),
  iconTheme: IconThemeData(color: lightTextColor),
);

final darkBaseColor = Color.fromARGB(255, 46, 46, 61);
final darkTextColor = Color.fromARGB(255, 255, 230, 230);
final darkTextStyle = TextStyle(color: darkTextColor, fontFamily: 'Cairo');
final darkTheme = NeumorphicThemeData(
  shadowLightColor: Color.fromARGB(255, 46, 46, 61),
  shadowLightColorEmboss: Color.fromARGB(255, 46, 46, 61),
  shadowDarkColor: Color.fromARGB(255, 20, 20, 20),
  baseColor: Color.fromARGB(255, 46, 46, 61),
  appBarTheme: NeumorphicAppBarThemeData(
    iconTheme: IconThemeData(color: darkTextColor),
    textStyle: TextStyle(
      color: darkTextColor,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.bold,
    ),
    buttonStyle: NeumorphicStyle(
      depth: 5,
      lightSource: LightSource.topRight,
    ),
  ),
  textTheme: TextTheme(
    headline1: darkTextStyle,
    headline2: darkTextStyle,
    headline3: darkTextStyle,
    headline4: darkTextStyle,
    headline5: darkTextStyle,
    headline6: darkTextStyle,
    subtitle1: darkTextStyle,
    subtitle2: darkTextStyle,
    bodyText1: darkTextStyle,
    bodyText2: darkTextStyle,
    caption: darkTextStyle,
    button: darkTextStyle,
    overline: darkTextStyle,
  ),
  buttonStyle: NeumorphicStyle(
    depth: 5,
    lightSource: LightSource.topRight,
  ),
  iconTheme: IconThemeData(color: darkTextColor),
);

class ThemeModel extends ChangeNotifier {
  static final themeValue = MapData.getThemeData();

  final equalColor = Color.fromARGB(255, 81, 81, 130);
  Color baseColor = themeValue == 'light' ? lightBaseColor : darkBaseColor;
  Color nonIntColor = themeValue == 'light'
      ? Color.fromARGB(255, 219, 219, 249)
      : Color.fromARGB(255, 55, 55, 70);

  var theme = themeValue == 'light' ? lightTheme : darkTheme;

  Future<void> changeTheme(String mode) async {
    switch (mode) {
      case 'light':
        {
          theme = lightTheme;
          baseColor = lightBaseColor;
          nonIntColor = Color.fromARGB(255, 219, 219, 249);

          await MapData.storeThemeData('light');

          break;
        }
      case 'dark':
        {
          theme = darkTheme;
          baseColor = darkBaseColor;
          nonIntColor = Color.fromARGB(255, 55, 55, 70);

          await MapData.storeThemeData('dark');

          break;
        }
    }
    notifyListeners();
  }
}
