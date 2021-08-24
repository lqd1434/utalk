import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/gradient.dart' as Lin;
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/socket/index.dart';
import 'package:myapp/utils/event_bus_event.dart';
import 'package:myapp/utils/event_manage.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/save_login_data.dart';
import 'package:rive/rive.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashStatePage();
}

class SplashStatePage extends State<Splash> {
  Logger logger = Logger();
  final GetxState getX = Get.find();

  @override
  void initState() {
    super.initState();
    _handleCheck();
  }

  void _handleCheck() async {
    final value = await getSharedData('name');
    if (value.isEmpty) {
      Get.toNamed('/auth');
    } else {
      doConn();
      EventManager.getInstance().eventBus!.on<StringEvent>().listen((event) {
        Future.delayed(const Duration(seconds: 3), () {
          Get.offAllNamed('/home');
        });
      });
    }
  }

  Future<void> doConn() async {
    final name = await getSharedData('name');
    final id = int.parse(await getSharedData('id'));
    final conn = await useSocket(id);
    if (getX.socket.value == null && name != '') {
      conn();
    }
  }

  final colorizeColors = [
    Colors.white,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: Lin.LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  HexColor('#7F7FDA'),
                  HexColor('#8787D2'),
                  HexColor('#7E83CB'),
                  HexColor('#A1A1EB'),
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                margin: const EdgeInsets.only(bottom: 30),
                child: const RiveAnimation.asset(
                  'static/flare/runner_boy.riv',
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    '努力加载数据中~',
                    textStyle: const TextStyle(
                        fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold),
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    '第一次加载时间可能会有点长',
                    textStyle: const TextStyle(
                        fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold),
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    '请耐心等待',
                    textStyle: const TextStyle(
                        fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold),
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: true,
                totalRepeatCount: 100,
              ),
            ],
          )),
    );
  }
}
