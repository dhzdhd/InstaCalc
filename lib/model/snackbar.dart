import 'package:flutter/material.dart';

class CreateSnackBar extends StatelessWidget {
  final String content;

  CreateSnackBar(this.content) ;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(this.content),
    );
  }
}