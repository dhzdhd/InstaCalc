import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../common/menu_drawer.dart';
import '../widgets/number_button.dart';
import '../model/calculate.dart';

class CalculatorRoute extends StatelessWidget {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xfff503e9), Color(0xff587cee)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 500.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'InstaCalc',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = linearGradient
            )
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          )
        ],
      ),
      drawer: MenuDrawer(),
      body: Calculator(),
    );
  }
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
        constraints: BoxConstraints(
          maxWidth: 1000
        ),
        child: Column(
          children: [
            DisplayContainer(),
            ButtonContainer()
          ],
        ),
      )
    );
  }
}

class DisplayContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Ink(
        color: Color.fromARGB(255, 36, 40, 54),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Consumer<CalculateModel>(
                      builder: (context, calc, child) {
                        return Text(
                          calc.finalText.join(),
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 16
                          ),
                        );
                      },
                    )
                  )
                ],
              )
            ),
            Divider(
              height: 3,
              color: Colors.white70,
            ),
            Flexible(
              flex: 3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<CalculateModel>(
                      builder: (context, calc, child) {
                        return Text(
                          calc.toBeParsed.join(),
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 12
                          ),
                        );
                      },
                    )
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 5,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(child: NumberButton('C', 'C', choice: 'cls',
                    secChoice: 'cls',)),
                  Flexible(child: NumberButton('(', '(')),
                  Flexible(child: NumberButton(')', ')')),
                  Flexible(child: NumberButton('÷', '/')),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(child: NumberButton('7', '7')),
                  Flexible(child: NumberButton('8', '8')),
                  Flexible(child: NumberButton('9', '9')),
                  Flexible(child: NumberButton('x', '*')),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(child: NumberButton('4', '4')),
                  Flexible(child: NumberButton('5', '5')),
                  Flexible(child: NumberButton('6', '6')),
                  Flexible(child: NumberButton('-', '-')),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(child: NumberButton('1', '1')),
                  Flexible(child: NumberButton('2', '2')),
                  Flexible(child: NumberButton('3', '3')),
                  Flexible(child: NumberButton('+', '+')),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(child: NumberButton('%', '%')),
                  Flexible(child: NumberButton('0', '0')),
                  Flexible(child: NumberButton('.', '.')),
                  Flexible(
                    child: NumberButton(
                      '=',
                      '=',
                      topGradient: Color.fromARGB(242, 217, 20, 175),
                      bottomGradient: Color.fromARGB(242, 57, 25, 146),
                      splashColor: Color.fromARGB(255, 187, 23, 193),
                      choice: 'equal',
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
          ],
        )
      )
    );
  }
}