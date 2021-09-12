import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/modes.dart';
import 'package:insta_calculator/widgets/drawer.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: NeumorphicAppBar(
        padding: 18,
        title: Consumer<ModeModel>(
          builder: (context, model, child) {
            return Text(model.title);
          },
        ),
        actions: [
          Hero(
            tag: 'history',
            child: NeumorphicButton(
              child: Icon(Icons.history),
              onPressed: () => Navigator.of(context).pushNamed('/history'),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Consumer<ModeModel>(builder: (context, model, child) {
        return model.currentMode;
      }),
    );
  }
}
