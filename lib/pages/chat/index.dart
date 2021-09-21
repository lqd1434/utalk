import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/socket/index.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/save_login_data.dart';

import 'chat_bottom.dart';
import 'components.dart';

class ChatWin extends StatefulWidget {
  const ChatWin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChatWinStatePage();
}

class ChatWinStatePage extends State<ChatWin> with WidgetsBindingObserver {
  final TextEditingController contentController = TextEditingController();
  bool _keyboard = false;
  Logger logger = Logger();
  final GetxState getX = Get.find();
  Function conn = () => {};

  @override
  void initState() {
    super.initState();
    _init();
    contentController.addListener(() {
      logger.i(contentController.text);
    });
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        _keyboard = visible;
      });
    });
  }

  _init() async {
    final id = int.parse(await getSharedData('id'));
    conn = await useSocket(id);
    getSharedData('name').then((name) {
      if (getX.socket.value == null && name != '') {
        conn();
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
          backgroundColor: HexColor('#7F7FDA'),
          leading: IconButton(
            splashColor: HexColor('#D8DAF8'),
            icon: const Icon(
              Icons.chevron_left,
              size: 35,
              color: Colors.white,
            ),
            onPressed: () {
              Get.toNamed('/home');
            },
          ),
          title: DefaultTextStyle(
            style: const TextStyle(fontSize: 18, fontFamily: 'Roboto', color: Colors.white),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                RotateAnimatedText(("sky").toUpperCase()),
                RotateAnimatedText(("sky").toUpperCase()),
                RotateAnimatedText(("sky").toUpperCase()),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    Get.toNamed("/chatSetting", arguments: Get.arguments);
                  },
                  icon: Icon(Icons.face, size: 27, color: HexColor('#FFFFFF'))),
            )
          ],
        ),
        body: SizedBox(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                _keyboard = false;
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
          bottomPadding: !_keyboard ? 0 : MediaQuery.of(context).viewInsets.bottom,
          controller: contentController,
        ));
  }
}
