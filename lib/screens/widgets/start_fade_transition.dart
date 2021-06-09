import 'package:flutter/material.dart';

class StartFadeTransition extends StatefulWidget {



  @override
  _StartFadeTransitionState createState() => _StartFadeTransitionState();
}

class _StartFadeTransitionState extends State<StartFadeTransition>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 5000),
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Text('This is a test'),
      ),
    );
  }
}
