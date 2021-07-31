import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/my_animation.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/pages/home/HomePage.dart';

import 'message_list.dart';

class Message extends StatefulWidget {
  final AnimationController? animationController;

  const Message({Key? key, this.animationController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MessageStatePage();
}

class MessageStatePage extends State<Message> {
  final Logger logger = Logger();
  final GetxState gexState = Get.find();

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
        backgroundColor: const Color.fromRGBO(101, 60, 179, 1),
        extendBody: true,
        body: Column(
          children: [
            MyFadeTransition(
                myAnimationController: widget.animationController!,
                myAnimation: myAnimation(widget.animationController, 1),
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.only(left: 20),
                  child: GNav(
                      onTabChange: _handleGNavChange,
                      gap: 5,
                      padding: const EdgeInsets.fromLTRB(12, 8, 10, 8),
                      rippleColor: Colors.deepPurple,
                      color: Colors.white,
                      activeColor: Colors.deepPurpleAccent,
                      tabBackgroundColor: Colors.white,
                      mainAxisAlignment: MainAxisAlignment.start,
                      tabMargin: const EdgeInsets.only(right: 10),
                      tabs: const [
                        GButton(text: '最近消息', icon: Icons.chat),
                        GButton(text: '特别关心', icon: Icons.favorite),
                      ]),
                )),
            Expanded(
                child: MyFadeTransition(
                    myAnimationController: widget.animationController!,
                    myAnimation: myAnimation(widget.animationController, 2),
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                        margin: const EdgeInsets.only(top: 0),
                        child: const MessageList())))
          ],
        ));
  }
}
