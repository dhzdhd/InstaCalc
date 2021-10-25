import 'dart:io';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/backend/database.dart';
import 'package:insta_calculator/backend/storage.dart';
import 'package:insta_calculator/models/calc.dart';
import 'package:insta_calculator/models/history.dart';
import 'package:insta_calculator/models/modes.dart';
import 'package:insta_calculator/models/percentage_calc.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:insta_calculator/routes/history.dart';
import 'package:insta_calculator/routes/home.dart';
import 'package:insta_calculator/routes/settings.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  await MapData.init();
  await DatabaseController.init();
  HistoryModel();

  runApp(MyApp());
}

class RemoveSplashBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails scrollableDetails) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeModel()),
        ChangeNotifierProvider(create: (context) => CalculateModel()),
        ChangeNotifierProvider(create: (context) => ModeModel()),
        ChangeNotifierProvider(create: (context) => HistoryModel()),
        ChangeNotifierProvider(create: (context) => PercentageCalculateModel()),
      ],
      child: Consumer<ThemeModel>(
        builder: (builder, model, child) {
          return ConstrainedBox(
            constraints: BoxConstraints(minWidth: 2000),
            child: NeumorphicApp(
              builder: (context, child) {
                return ScrollConfiguration(
                  behavior: RemoveSplashBehaviour(),
                  child: child as Widget,
                );
              },
              debugShowCheckedModeBanner: false,
              title: "InstaCalc",
              theme: model.theme,
              darkTheme: model.theme,
              initialRoute: '/',
              routes: <String, Widget Function(BuildContext)>{
                '/': (context) => HomeRoute(),
                '/settings': (context) => SettingsRoute(),
                '/history': (context) => HistoryRoute(),
              },
            ),
          );
        },
      ),
    );
  }
}
