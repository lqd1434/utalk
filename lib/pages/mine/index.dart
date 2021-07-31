import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/components/my_animation.dart';
import 'package:myapp/components/my_slimy_card.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/pages/home/HomePage.dart';
import 'package:myapp/utils/hex_color.dart';

import 'components.dart';

class Mine extends StatefulWidget {
  final AnimationController? animationController;

  const Mine({Key? key, this.animationController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MineStatePage();
}

class MineStatePage extends State<Mine> {
  final Logger logger = Logger();

  _handleBack() {
    Navigator.popAndPushNamed(context, '/home');
  }

  final GetxState gexState = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => {gexState.changeIsShowAppBar(false)});
  }

  @override
  Widget build(BuildContext context) {
    widget.animationController?.forward();
    return Scaffold(
        backgroundColor: const Color.fromRGBO(241, 242, 249, 1),
        body: SingleChildScrollView(
            child: Column(
          children: [
            MyFadeTransition(
              myAnimation: myAnimation(widget.animationController, 1),
              myAnimationController: widget.animationController!,
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
                child: MySlimyCard(
                  threeBgGradient: [
                    HexColor('#7D62E7'),
                    HexColor('#7E83CB'),
                    HexColor('#C6BAF5'),
                  ],
                  width: MediaQuery.of(context).size.width,
                  topCardHeight: 260,
                  bottomCardHeight: 100,
                  borderRadius: 30,
                  topCardWidget: topWidget(),
                  bottomCardWidget: const MyCountInfo(),
                  slimeEnabled: true,
                ),
              ),
            ),
            MyFadeTransition(
                myAnimation: myAnimation(widget.animationController, 2),
                myAnimationController: widget.animationController!,
                child: const SizedBox(height: 500, child: MineCellGroup())),
          ],
        )));
  }
}

Widget topWidget() {
  return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 115,
            height: 130,
            child: Stack(children: [
              const RadiusImage(
                image: NetworkImage('http://47.103.211.10:9090/static/images/avatar.png'),
                widthAndHeight: 110,
                radius: 55,
              ),
              Positioned(
                  left: 40,
                  bottom: -5,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: HexColor('#7D62E7'),
                    ),
                  ))
            ]),
          ),
          const SizedBox(height: 10),
          Text('爱哭的鱼',
              style: TextStyle(
                  color: HexColor('#D5FA65'),
                  fontSize: 25,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500)),
        ],
      ));
}
