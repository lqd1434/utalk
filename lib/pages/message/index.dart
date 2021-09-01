// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/my_animation.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/pages/home/HomePage.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'message_list.dart';

class Message extends StatefulWidget {
  final AnimationController? animationController;

  const Message({Key? key, this.animationController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MessageStatePage();
}

class MessageStatePage extends State<Message> with AutomaticKeepAliveClientMixin {
  final Logger logger = Logger();
  final GetxState gexState = Get.find();

  @override
  bool get wantKeepAlive => true;

  void _handleGNavChange(index) {
    logger.i(index);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => {gexState.changeIsShowAppBar(true)});
  }

  @override
  Widget build(BuildContext context) {
    widget.animationController?.forward();
    return Scaffold(
        backgroundColor: HexColor('#7F7FDA'),
        body: Column(
          children: [
            MyFadeTransition(
                myAnimationController: widget.animationController!,
                myAnimation: myAnimation(widget.animationController, 2),
                child: Container(
                    height: 70,
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GNav(
                            onTabChange: _handleGNavChange,
                            gap: 5,
                            padding: const EdgeInsets.fromLTRB(12, 8, 10, 8),
                            rippleColor: HexColor('#7F7FDA'),
                            color: Colors.white,
                            activeColor: HexColor('#7F7FDA'),
                            tabBackgroundColor: Colors.white,
                            mainAxisAlignment: MainAxisAlignment.start,
                            tabMargin: const EdgeInsets.only(right: 10),
                            tabs: const [
                              GButton(
                                text: '好友消息',
                                icon: Icons.chat,
                              ),
                              GButton(text: '群聊消息', icon: Icons.forum),
                            ]),
                      ],
                    ))),
            Expanded(
                child: MyFadeTransition(
                    myAnimationController: widget.animationController!,
                    myAnimation: myAnimation(widget.animationController, 3),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -280,
                          child: WaveWidget(
                            config: CustomConfig(
                              gradients: [
                                [HexColor('#D6D8FA'), HexColor('#A8ADF5')],
                                [HexColor('#575ED9'), HexColor('#A8ADF5')],
                                [HexColor('#F3D4F5'), HexColor('#FDFDFF')],
                                [HexColor('#FDFDFF'), HexColor('#FFFFFF')],
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
                              900,
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 0),
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                            child: const MessageList())
                      ],
                    )))
          ],
        ));
  }
}
