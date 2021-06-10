import 'dart:async';

import 'package:flutter/material.dart';

class StartFadeTransition extends StatefulWidget {
  final Curve curves;
  final Widget child;
  final int durationInMilliseconds;
  final int delay;

  StartFadeTransition({
    @required this.curves,
    @required this.child,
    @required this.durationInMilliseconds,
    @required this.delay,
  });

  @override
  _StartFadeTransitionState createState() => _StartFadeTransitionState();
}

class _StartFadeTransitionState extends State<StartFadeTransition>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationInMilliseconds),
      value: 0,
      lowerBound: 0,
      upperBound: 1,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curves,
    );

    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(_animation);

    if (widget.delay == null) {
      _controller.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FadeTransition(
        opacity: _animation,
        child: SlideTransition(
          child: widget.child,
          position: _animOffset,
        ),
      ),
    );
  }
}
