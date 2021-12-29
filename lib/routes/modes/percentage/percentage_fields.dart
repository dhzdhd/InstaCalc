import 'package:flutter/material.dart';

class PercentageField extends StatelessWidget {
  final placeholder;
  final textAlignment;

  PercentageField({required this.placeholder, required this.textAlignment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5, left: 5),
      child: Container(
        child: TextField(
          textAlign: textAlignment,
          readOnly: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15, right: 15),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            hintText: placeholder,
            hintStyle: TextStyle(fontSize: 30),
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
          Spacer(),
          Flexible(
            flex: 10,
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: Column(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          '352',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          '35223523',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
