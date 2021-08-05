import 'package:flutter/material.dart';

class MyFadeTransition extends StatefulWidget {
  final AnimationController myAnimationController;
  final Animation<double> myAnimation;
  final Widget child;

  const MyFadeTransition(
      {Key? key,
      required this.myAnimationController,
      required this.myAnimation,
      required this.child})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyFadeTransitionStatePage();
}

class _MyFadeTransitionStatePage extends State<MyFadeTransition> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.myAnimationController,
        child: widget.child,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: widget.myAnimation,
              child: Transform(
                  transform:
                      Matrix4.translationValues(0.0, 30 * (1.0 - widget.myAnimation.value), 0.0),
                  child: child));
        });
  }
}
