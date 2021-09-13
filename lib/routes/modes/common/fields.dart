import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/calc.dart';
import 'package:provider/provider.dart';

class FieldContainer extends StatefulWidget {
  @override
  _FieldContainerState createState() => _FieldContainerState();
}

class _FieldContainerState extends State<FieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
          depth: -5,
          lightSource: LightSource.topLeft,
          intensity: 5,
        ),
        child: Consumer<CalculateModel>(builder: (context, model, child) {
          return Column(
            children: [
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      CalculateModel.topText,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      children: [
                        Text(
                          CalculateModel.bottomText,
                          style: TextStyle(
                              fontSize: 70, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
