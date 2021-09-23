import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PercentageField extends StatelessWidget {
  final placeholder;
  final textAlignment;

  PercentageField({required this.placeholder, required this.textAlignment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5, left: 5),
      child: Neumorphic(
        style: NeumorphicStyle(depth: -5),
        child: TextField(
          textAlign: textAlignment,
          readOnly: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15, right: 15),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}

class PercentageFieldContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Row(
              children: [
                Flexible(
                  child: PercentageField(
                    placeholder: 'Number',
                    textAlignment: TextAlign.left,
                  ),
                ),
                Flexible(
                  child: PercentageField(
                    placeholder: 'Percent',
                    textAlignment: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 10,
            child: Neumorphic(
              child: Text(
                '8758',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Neumorphic(
              child: Text('969'),
            ),
          ),
        ],
      ),
    );
  }
}
