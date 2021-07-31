import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/socket/index.dart';

import 'chat_bottom.dart';
import 'components.dart';

class ChatWin extends StatefulWidget {
  const ChatWin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChatWinStatePage();
}

class ChatWinStatePage extends State<ChatWin> with WidgetsBindingObserver {
  final TextEditingController contentController = TextEditingController();
  double bottomPadding = 0;
  Logger logger = Logger();
  final GetxState getX = Get.find();
  final conn = useSocket();

  @override
  void initState() {
    super.initState();
    if (getX.socket.value == null) {
      conn();
    }
    contentController.addListener(() {
      logger.i(contentController.text);
    });
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible) {
        setState(() {
          bottomPadding = 280;
        });
      } else {
        setState(() {
          bottomPadding = 0;
        });
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        {
          logger.i("app in resumed");
          logger.w(getX.socket.value);
          if (getX.socket.value == null) {
            conn();
          }
        }
        break;
      case AppLifecycleState.inactive:
        logger.e("app in inactive");
        break;
      case AppLifecycleState.paused:
        logger.i("app in paused");
        break;
      case AppLifecycleState.detached:
        logger.i("app in detached");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              size: 35,
            ),
            onPressed: () {
              Get.toNamed("/home");
            },
          ),
          title: const Text('聊天'),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/chatSetting");
                  },
                  child: const Icon(Icons.face, size: 27)),
            )
          ],
        ),
        body: SizedBox(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                bottomPadding = 0;
              });
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
                color: const Color.fromRGBO(241, 242, 249, 1),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: const ChatList()),
          ),
        ),
        bottomNavigationBar: ChatBottom(
          bottomPadding: bottomPadding,
          controller: contentController,
        ));
  }
}
