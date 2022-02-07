import 'package:flutter/material.dart';

class AnimatedButtonWidget extends StatefulWidget {
  final Widget child;
  final onPressed;

  AnimatedButtonWidget({required this.child, required this.onPressed});

  @override
  _AnimatedButtonWidgetState createState() => _AnimatedButtonWidgetState();
}

class _AnimatedButtonWidgetState extends State<AnimatedButtonWidget>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  late AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = _controller.drive(Tween<double>(begin: 1, end: 110));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.scale(
          scale: _animation.value,
          child: TextButton(
            child: Visibility(visible: _visible, child: widget.child),
            onPressed: () {
              setState(() {
                _visible = !_visible;
                if (_controller.isDismissed) {
                  _controller
                      .forward()
                      .then((_) => widget.onPressed())
                      .then((_) => _controller.reset())
                      .then((_) => _visible = !_visible);
                }
              });
            },
          ),
        );
      },
    );
  }
}
