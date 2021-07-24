import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: SizedBox.expand(
          child: Stack(
            children: [
              const RiveAnimation.asset(
                'static/flare/blueplanet.riv',
                fit: BoxFit.cover,
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                    '加载中...',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ))
            ],
          ),
        ));
  }
}
