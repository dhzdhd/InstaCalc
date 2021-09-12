import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/calc.dart';
import 'package:insta_calculator/models/modes.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:insta_calculator/routes/history.dart';
import 'package:insta_calculator/routes/home.dart';
import 'package:insta_calculator/routes/settings.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider(create: (context) => ModeModel())
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
