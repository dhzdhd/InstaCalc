import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/calc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

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
              Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 10, left: 10, top: 5),
                          child: NeumorphicButton(
                            style: NeumorphicStyle(depth: 5),
                            child: Icon(Icons.copy),
                            onPressed: () => Clipboard.setData(ClipboardData(
                                text: model.topText == ''
                                    ? '${model.bottomText} = ${model.bottomText}'
                                    : '${model.bottomText} = ${model.topText}')),
                          )),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              model.topText,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Expanded(
                flex: 7,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      children: [
                        Text(
                          model.bottomText,
                          style: TextStyle(
                              fontSize: 65, fontWeight: FontWeight.bold),
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
