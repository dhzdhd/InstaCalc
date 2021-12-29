import 'package:flutter/material.dart';
import 'package:insta_calculator/models/modes.dart';
import 'package:insta_calculator/routes/drawer.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Consumer<ModeModel>(
          builder: (context, model, child) {
            return Text(model.title);
          },
        ),
        actions: [
          Hero(
            tag: 'history',
            child: ElevatedButton(
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
