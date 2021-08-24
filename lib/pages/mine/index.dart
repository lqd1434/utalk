import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/my_animation.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/pages/home/HomePage.dart';
import 'package:myapp/pages/mine/top_info_card.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

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
        extendBody: true,
        body: SingleChildScrollView(
            child: Column(
          children: [
            MyFadeTransition(
              myAnimation: myAnimation(widget.animationController, 1),
              myAnimationController: widget.animationController!,
              child: const TopInfoCard(),
            ),
            Stack(
              children: [
                Positioned(
                  top: -220,
                  child: MyFadeTransition(
                    myAnimation: myAnimation(widget.animationController, 2),
                    myAnimationController: widget.animationController!,
                    child: WaveWidget(
                      config: CustomConfig(
                        gradients: [
                          [HexColor('#D6D8FA'), HexColor('#A8ADF5')],
                          [HexColor('#575ED9'), HexColor('#A8ADF5')],
                          [HexColor('#F3D4F5'), HexColor('#FDFDFF')],
                          [HexColor('#FDFDFF'), HexColor('#D4D5F5')],
                        ],
                        durations: [35000, 19440, 10800, 6000],
                        heightPercentages: [0.20, 0.23, 0.25, 0.30],
                        blur: const MaskFilter.blur(BlurStyle.solid, 10),
                        gradientBegin: Alignment.bottomLeft,
                        gradientEnd: Alignment.topRight,
                      ),
                      waveAmplitude: 0,
                      size: Size(
                        MediaQuery.of(context).size.width,
                        800,
                      ),
                    ),
                  ),
                ),
                MyFadeTransition(
                    myAnimation: myAnimation(widget.animationController, 2),
                    myAnimationController: widget.animationController!,
                    child: Container(
                        height: 500,
                        margin: const EdgeInsets.only(top: 50),
                        child: const MineCellGroup())),
              ],
            )
          ],
        )));
  }
}
