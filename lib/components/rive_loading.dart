import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveLoading extends StatelessWidget {
  final double size;

  const RiveLoading({Key? key, this.size = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        child: const RiveAnimation.asset(
          'static/flare/loading.riv',
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
