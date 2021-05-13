import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';
import 'routes/calc_route.dart';
import 'routes/settings_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaCalc',
      theme: darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => CalculatorRoute(),
        '/settings': (context) => SettingsRoute()
      },
    );
  }
}
