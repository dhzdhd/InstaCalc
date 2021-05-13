import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Ink(
        color: Color.fromARGB(255, 38, 50, 74),
        child: Container(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 36, 40, 53)
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 23
                  ),
                )
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text('Home'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text('Settings'),
                onTap: () => [
                  Navigator.pop(context),
                  Navigator.pushNamed(context, '/settings')
                ],
              )
            ],
          )
        ),
      )
    );
  }
}