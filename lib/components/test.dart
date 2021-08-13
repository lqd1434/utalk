import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  Logger logger = Logger();

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 5))
      ..addStatusListener((status) {
        print(animation.value);
      });
    animation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.easeInCirc))
        .animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            IconButton(
                onPressed: () {
                  animationController.forward();
                  if (animationController.isCompleted) {
                    animationController.reverse();
                  }
                },
                icon: const Icon(Icons.add)),
            const SizedBox(
              height: 30,
            ),
            RotationTransition(
              alignment: Alignment.center,
              //动画控制器
              turns: animationController,
              //将要执行动画的子view
              child: GestureDetector(
                onVerticalDragDown: (details) {
                  logger.i(details.localPosition);
                  animationController.forward();
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                ),
              ),
            ),
            // AnimatedBuilder(
            //   animation: animation,
            //   child: const FlutterLogo(size: 80),
            //   builder: (BuildContext context, Widget? child) {
            //     return RotationTransition(
            //       turns: animation,
            //       child: ScaleTransition(
            //         scale: animation,
            //         child: FadeTransition(
            //           opacity: animation,
            //           child: child,
            //           // child: Transform(
            //           //   transform: Matrix4.translationValues(0, animation.value * 60, 0),
            //           //   child: child,
            //           // ),
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
