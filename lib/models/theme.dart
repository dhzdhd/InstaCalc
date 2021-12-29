import 'package:flutter/material.dart';
import 'package:insta_calculator/backend/storage.dart';

final lightBaseColor = Color.fromARGB(255, 235, 235, 255);
final lightTextColor = Color.fromARGB(255, 77, 77, 123);
final lightTextStyle = TextStyle(color: lightTextColor, fontFamily: 'Cairo');
final lightTheme = ThemeData(
  backgroundColor: lightBaseColor,
  scaffoldBackgroundColor: lightBaseColor,
  appBarTheme: AppBarTheme(
    backgroundColor: lightBaseColor,
    iconTheme: IconThemeData(color: lightTextColor),
    titleTextStyle: TextStyle(
        color: lightTextColor,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold,
        fontSize: 20),
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
  iconTheme: IconThemeData(color: lightTextColor, size: 25),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(4),
      backgroundColor: MaterialStateProperty.all(lightBaseColor),
    ),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: lightBaseColor,
  ),
);

final darkBaseColor = Color.fromARGB(255, 46, 46, 61);
final darkTextColor = Color.fromARGB(255, 255, 230, 230);
final darkTextStyle = TextStyle(color: darkTextColor, fontFamily: 'Cairo');
final darkTheme = ThemeData(
  backgroundColor: darkBaseColor,
  scaffoldBackgroundColor: darkBaseColor,
  appBarTheme: AppBarTheme(
    backgroundColor: darkBaseColor,
    iconTheme: IconThemeData(color: darkTextColor),
    titleTextStyle: TextStyle(
      color: darkTextColor,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.bold,
      fontSize: 20,
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
  iconTheme: IconThemeData(color: darkTextColor, size: 25),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(4),
      backgroundColor: MaterialStateProperty.all(darkBaseColor),
    ),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: darkBaseColor,
  ),
);

class ThemeModel extends ChangeNotifier {
  static final themeValue = MapData.getData(key: 'theme');

  final equalColor = Color.fromARGB(255, 81, 81, 130);
  Color baseColor = themeValue == 'light' ? lightBaseColor : darkBaseColor;
  Color secondaryColor = themeValue == 'light'
      ? Color.fromARGB(255, 219, 219, 249)
      : Color.fromARGB(255, 55, 55, 70);

  var theme = themeValue == 'light' ? lightTheme : darkTheme;

  Future<void> changeTheme(String mode) async {
    switch (mode) {
      case 'light':
        {
          theme = lightTheme;
          baseColor = lightBaseColor;
          secondaryColor = Color.fromARGB(255, 219, 219, 249);

          await MapData.storeData(key: 'theme', value: 'light');

          break;
        }
      case 'dark':
        {
          theme = darkTheme;
          baseColor = darkBaseColor;
          secondaryColor = Color.fromARGB(255, 55, 55, 70);

          await MapData.storeData(key: 'theme', value: 'dark');

          break;
        }
    }
    notifyListeners();
  }
}
