import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/getwidget.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/cell.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/components/my_slimy_card.dart';
import 'package:myapp/components/swiper_action.dart';
import 'package:get/get.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:slimy_card/slimy_card.dart';

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
    return Scaffold(
        backgroundColor: const Color.fromRGBO(241, 242, 249, 1),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
              child: MySlimyCard(
                threeBgGradient: [
                  HexColor('#757BD4'),
                  HexColor('#7E83CB'),
                  HexColor('#A2A6DA'),
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
            const SizedBox(height: 500, child: MineCellGroup()),
          ],
        )));
  }
}

Widget topWidget() {
  return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      // alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 115,
            height: 130,
            child: Stack(children: [
              const RadiusImage(
                image: AssetImage('static/images/avatar.png'),
                widthAndHeight: 110,
                radius: 55,
              ),
              Positioned(
                  left: 40,
                  bottom: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]),
                    child: const Icon(Icons.edit),
                  ))
            ]),
          ),
          const SizedBox(height: 10),
          const Text('sky',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500)),
        ],
      ));
}
