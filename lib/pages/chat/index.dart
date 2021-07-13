import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/socket/index.dart';

import 'components.dart';

class ChatWin extends StatefulWidget {
  const ChatWin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChatWinStatePage();
}

class ChatWinStatePage extends State<ChatWin> with WidgetsBindingObserver{
  final TextEditingController contentController = TextEditingController();
  double bottomPadding = 0;
  Logger logger = Logger();
  final GetxState getX = Get.find();
  final conn = useSocket();


  @override
  void initState() {
    super.initState();
    if(getX.socket.value == null){
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
          if(getX.socket.value == null){
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
        resizeToAvoidBottomInset: false,
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
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            setState(() {
              bottomPadding = 0;
            });
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              color: const Color.fromRGBO(243, 243, 243, 1),
              child: Column(
                children: [
                  const Flexible(
                    child: MessageList()
                  ),
                  ChatBottom(
                    bottomPadding: bottomPadding,
                    controller: contentController,
                  )
                ],
              )),
        ));
  }
}

InputBorder inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    width: 1,
    color: Colors.blueAccent,
  ),
);
