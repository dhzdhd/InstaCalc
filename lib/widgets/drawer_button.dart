import 'package:flutter/material.dart';

class CustomDrawerButton extends StatelessWidget {
  final icon;
  final text;
  final func;

  CustomDrawerButton(
      {required this.icon, required this.text, required this.func});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () => func(),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Icon(icon),
              ),
              Spacer(flex: 1),
              Flexible(
                flex: 10,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
