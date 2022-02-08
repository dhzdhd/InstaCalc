import 'dart:math';

import 'package:flutter/material.dart';

class HistoryTile extends StatefulWidget {
  final String date;
  final List<Widget> children;

  HistoryTile({required this.date, required this.children});

  @override
  State<HistoryTile> createState() => _HistoryTileState();
}

class _HistoryTileState extends State<HistoryTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<double> _animation;
  var _offset = 0.0;
  var _buttonVisibility = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Stack(
        children: [
          Visibility(
            visible: _buttonVisibility,
            child: ElevatedButton(onPressed: () {}, child: Text('delete')),
          ),
          Transform.translate(
            offset: Offset(_offset, 0),
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                setState(() {
                  if (!(_offset == 80)) {
                    _offset = 0;
                  }
                });
              },
              onHorizontalDragUpdate: ((details) {
                print(details.localPosition.dx);
                setState(() {
                  if (details.localPosition.dx >= 80) {
                    _offset = 80;
                    _buttonVisibility = true;
                  } else {
                    _buttonVisibility = false;
                    _offset = details.localPosition.dx;
                  }
                });

                setState(() {});
              }),
              child: ElevatedButton(
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    child: Column(children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(widget.date,
                                  style: TextStyle(fontSize: 25)),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: AnimatedBuilder(
                              animation: _controller,
                              child: const Icon(Icons.keyboard_arrow_right),
                              builder: (_, child) {
                                return Transform.rotate(
                                  angle: _animation.value * pi / 2,
                                  child: child,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      SizeTransition(
                        sizeFactor: _animation,
                        child: Container(
                          child: Column(
                            children: widget.children,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _controller.isDismissed
                        ? _controller.forward()
                        : _controller.reverse();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryContentTile extends StatelessWidget {
  final String heading;
  final String expr;
  final String result;

  HistoryContentTile(
      {required this.heading, required this.expr, required this.result});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  heading,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    expr,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    result,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
