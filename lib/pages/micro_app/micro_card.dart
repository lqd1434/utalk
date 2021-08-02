import 'package:flutter/material.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/components/my_animation.dart';

class MicroCard extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const MicroCard({Key? key, this.animationController, this.animation}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MicroCardStatePage();
}

class _MicroCardStatePage extends State<MicroCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.animationController!,
        child: getChild(),
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: widget.animation!,
              child: Transform(
                  transform:
                      Matrix4.translationValues(100 * (1.0 - widget.animation!.value), 0.0, 0.0),
                  child: child));
        });
  }
}

class MicroCardList extends StatefulWidget {
  final AnimationController? parentAnimationController;
  final Animation<double>? parentAnimation;

  const MicroCardList({Key? key, this.parentAnimationController, this.parentAnimation})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MicroCardListStatePage();
}

class _MicroCardListStatePage extends State<MicroCardList> with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 2),
        child: MyFadeTransition(
            myAnimation: widget.parentAnimation!,
            myAnimationController: widget.parentAnimationController!,
            child: Container(
              height: 220,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animationController!,
                          curve: Interval((1 / 5) * index, 1.0, curve: Curves.fastOutSlowIn)));
                  animationController?.forward();
                  return MicroCard(
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
            )));
  }
}

Widget getChild() {
  return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 32, left: 0, right: 8, bottom: 16),
              child: Stack(
                children: [
                  Container(
                      width: 120,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(99, 107, 230, 1),
                              Color.fromRGBO(108, 115, 221, 1),
                              Color.fromRGBO(140, 161, 235, 1)
                            ]),
                        boxShadow: [
                          BoxShadow(color: Color.fromRGBO(140, 161, 235, 1), blurRadius: 5)
                        ],
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(54.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50, left: 10, right: 16, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('大鱼影视',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    letterSpacing: 3)),
                            SizedBox(height: 5),
                            Text('音乐',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            SizedBox(height: 2),
                            Text('放松',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          ],
                        ),
                      )),
                ],
              )),
          const Positioned(
              top: 0,
              left: 5,
              child: RadiusImage(
                image: NetworkImage(
                  'http://47.103.211.10:9090/static/images/avatar.png',
                ),
                widthAndHeight: 60,
                radius: 30,
              )),
          Positioned(
              bottom: 20,
              left: 13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('1568',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: 1)),
                  Text('人',
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white)),
                ],
              )),
        ],
      ));
}
