// ignore_for_file: file_names

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/hive/adapter/user_adapter.dart';
import 'package:myapp/pages/drawer/index.dart';
import 'package:myapp/pages/friends/index.dart';
import 'package:myapp/pages/message/index.dart';
import 'package:myapp/pages/micro_app/index.dart';
import 'package:myapp/pages/mine/index.dart';

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
  late Box<User> box;

  final GetxState getX = Get.find();
  DateTime lastPopTime = DateTime.now();
  Widget view = Container(color: Colors.white);
  AnimationController? animationController;
  Function conn = () {};

  //切换tab时反转动画,形成进入和退场动画
  void handleItemSelected(index) {
    getX.changeIndex(index);
    animationController?.reverse().then<dynamic>((data) {
      if (!mounted) {
        return;
      }
      setState(() {
        view = getView(index);
      });
    });
  }

  Widget getView(index) {
    Widget viewBody;
    switch (index) {
      case 0:
        viewBody = Message(animationController: animationController!);
        break;
      case 1:
        viewBody = Friends(animationController: animationController!);
        break;
      case 2:
        viewBody = MicroAppPlayGround(animationController: animationController!);
        break;
      case 3:
        viewBody = Mine(animationController: animationController!);
        break;
      default:
        viewBody = Message(animationController: animationController!);
    }
    return viewBody;
  }

  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(milliseconds: 600), vsync: this);

    animationController?.forward();
    view = getView(getX.currentIndex.value);
    WidgetsBinding.instance!.addObserver(this);
    // _init();
    box = Hive.box('userBox');
    final user = User();
    user.name = '11';
    user.age = 20;
    box.add(user);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
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
    if (getX.ctx.value == null) {
      getX.setCtx(context);
    }
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
                  Flexible(child: view),
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
