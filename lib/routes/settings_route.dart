import 'package:flutter/material.dart';

class SettingsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
            'Settings'
        ),
      ),
      body: Settings(),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListTile(
            leading: Switch(
              value: false,
              onChanged: (bool) => print('lol'),
            ),
            title: Text(
              'Light Mode'
            ),
          ),
          Divider(thickness: 5,)
        ],
      ),
    );
  }
}