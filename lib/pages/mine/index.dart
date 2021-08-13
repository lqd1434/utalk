import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/my_animation.dart';
import 'package:myapp/components/my_slimy_card.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/pages/home/HomePage.dart';
import 'package:myapp/pages/mine/top_info_card.dart';
import 'package:myapp/utils/hex_color.dart';

import 'components.dart';

class Mine extends StatefulWidget {
  final AnimationController? animationController;

  const Mine({Key? key, this.animationController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MineStatePage();
}

class MineStatePage extends State<Mine> with TickerProviderStateMixin {
  final Logger logger = Logger();

  final GetxState gexState = Get.find();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => {gexState.changeIsShowAppBar(false)});
    super.initState();
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
                  topCardWidget: const TopInfoCard(),
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
