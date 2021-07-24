// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/my_drawer.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/pages/friends/index.dart';
import 'package:myapp/pages/message/index.dart';
import 'package:myapp/pages/micro_app/index.dart';
import 'package:myapp/pages/mine/index.dart';
import 'package:myapp/socket/index.dart';
import 'package:myapp/utils/save_login_data.dart';

import 'bottom_bar.dart';
import 'home_header.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MainPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  Logger logger = Logger();

  final GetxState getX = Get.find();
  final conn = useSocket();
  DateTime lastPopTime = DateTime.now();
  Widget viewBody = Container(color: Colors.white);
  AnimationController? animationController;

  void handleItemSelected(index) {
    getX.changeIndex(index);
    animationController?.reverse().then<dynamic>((data) {
      if (!mounted) {
        return;
      }
      switch (index) {
        case 0:
          setState(() {
            viewBody = Message(animationController: animationController!);
          });
          break;
        case 1:
          setState(() {
            viewBody = Friends(animationController: animationController!);
          });
          break;
        case 2:
          setState(() {
            viewBody = MicroAppPlayGround(animationController: animationController!);
          });
          break;
        case 3:
          setState(() {
            viewBody = Mine(animationController: animationController!);
          });
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(milliseconds: 600), vsync: this);

    animationController?.forward();
    viewBody = Message(
      animationController: animationController,
    );

    WidgetsBinding.instance!.addObserver(this);
    getSharedData('name').then((name) {
      if (getX.socket.value == null && name != '') {
        conn();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
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

  Future<bool> _onWillPop() async {
    if (DateTime.now().difference(lastPopTime) > const Duration(seconds: 2)) {
      lastPopTime = DateTime.now();
      BotToast.showText(text: '2s内再按一次退出');
      return false;
    } else {
      lastPopTime = DateTime.now();
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Obx(() => Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              drawer: const MyDrawer(),
              body: Column(
                children: [
                  HomeHeader(
                    visible: getX.isShowAppbar.value,
                    topPadding: MediaQuery.of(context).padding.top + 10,
                    animationController: animationController!,
                  ),
                  Expanded(child: viewBody),
                ],
              ),
          bottomNavigationBar: BottomBar(
            selectedIndex: getX.currentIndex.value,
            handleItemSelected: handleItemSelected,
          ),
            )));
  }
}

Animation<double> myAnimation(AnimationController? animationController, int index) {
  return Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController!,
      curve: Interval((1 / 5) * index, 1.0, curve: Curves.fastOutSlowIn)));
}
