import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_animation.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/pages/home/HomePage.dart';

import 'favorite_app.dart';
import 'micro_card.dart';
import 'micro_header.dart';

class MicroAppPlayGround extends StatefulWidget {
  final AnimationController? animationController;

  const MicroAppPlayGround({Key? key, this.animationController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MicroAppPlayGroundStatePage();
}

class MicroAppPlayGroundStatePage extends State<MicroAppPlayGround> with TickerProviderStateMixin {
  late Animation<double>? topAnimation;

  final GetxState gexState = Get.find();

  @override
  void initState() {
    super.initState();
    topAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: widget.animationController!,
        curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    WidgetsBinding.instance!.addPostFrameCallback((_) => gexState.changeIsShowAppBar(false));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(191, 199, 231, 1),
      body: Container(
        color: const Color.fromRGBO(241, 242, 249, 1),
        child: ListView(
          children: [
            MyFadeTransition(
                myAnimationController: widget.animationController!,
                myAnimation: myAnimation(widget.animationController, 1),
                child: const SizedBox(
                  height: 100,
                  child: MicroHeader(),
                )),
            MyFadeTransition(
              myAnimationController: widget.animationController!,
              myAnimation: myAnimation(widget.animationController, 2),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 300,
                child: ZoomIn(child: const FavoriteApp()),
              ),
            ),
            MyFadeTransition(
              myAnimationController: widget.animationController!,
              myAnimation: myAnimation(widget.animationController, 3),
              child: Container(
                height: 30,
                margin: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('今日推荐',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 0.6))),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text('more', style: TextStyle(fontSize: 18, color: Colors.blue)),
                          SizedBox(width: 8),
                          Icon(Icons.east, size: 26, color: Colors.blue)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                } else {
                  widget.animationController?.forward();
                  return MicroCardList(
                    parentAnimation: myAnimation(widget.animationController, 4),
                    parentAnimationController: widget.animationController!,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
