// ignore_for_file: file_names

import 'package:bot_toast/bot_toast.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/components/my_drawer.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/pages/friends/index.dart';
import 'package:myapp/pages/message/index.dart';
import 'package:myapp/pages/mine/index.dart';
import 'package:myapp/pages/moodSpace/index.dart';
import 'package:myapp/socket/index.dart';
import 'package:myapp/utils/save_login_data.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainPage> createState() => _MyMainPageState();

}

class _MyMainPageState extends State<MainPage> with WidgetsBindingObserver{
  int currentIndex = 0;
  Logger logger = Logger();

  final GetxState getX = Get.find();
  late PageController _pageController;
  double appBarHeight = 55;
  final conn = useSocket();

  void handleItemSelected(index){
    if(index>=2){
      setState(() {
        appBarHeight = 0;
      });
    } else{
      setState(() {
        appBarHeight = 55;
      });
    }
    setState(() {
      currentIndex = index;
    });
    getX.changeIndex(index);
    _pageController.jumpToPage(index);
  }

  void handlePageChanged(index){
    if(index>=2){
      setState(() {
        appBarHeight = 0;
      });
    } else{
      setState(() {
        appBarHeight = 55;
      });
    }
    getX.changeIndex(index);
    setState(() => currentIndex = index);
  }



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    _pageController = PageController();
    if(getX.socket.value == null){
      conn();
    }
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

  void handlePressed()async{
    removeAllSharedData();
    Get.toNamed('/auth');
  }


  DateTime lastPopTime = DateTime.now();
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(lastPopTime) > const Duration(seconds: 2)) {
          lastPopTime = DateTime.now();
          BotToast.showText(text: '2s内再按一次退出');
          return false;
        } else {
          lastPopTime = DateTime.now();
          return true;
        }
      },
      child: Scaffold(
        key: _key,
        drawer: const MyDrawer(),
        appBar:PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,appBarHeight),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(255, 245, 254, 1),
            leading: SizedBox(
                child: GestureDetector(
                  onTap: (){_key.currentState!.openDrawer();},
                  child: const RadiusImage(
                      radius: 20,
                      widthAndHeight: 40,
                      image: AssetImage('static/images/avatar.png')
                  ),
                )
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.add, size: 30),
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: handlePressed,
        // ),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {handlePageChanged(index);},
            children:const <Widget>[
               Message(),
               Friends(),
               MoodSpace(),
               Mine(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(() => BottomNavyBar(
          backgroundColor: const Color.fromRGBO(233, 245, 254, 1),
          selectedIndex: getX.currentIndex.value,
          onItemSelected: (index) {handleItemSelected(index);},
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              title: const Text('消息'), icon: const Icon(Icons.chat_bubble)),
            BottomNavyBarItem(
              activeColor: const Color.fromRGBO(128, 0, 255, 1),
              title: const Text('好友'),
              icon: const Icon(Icons.people)),
            BottomNavyBarItem(
              activeColor: const Color.fromRGBO(0, 204, 204, 1),
              title: const Text('空间'), icon: const Icon(Icons.camera)),
            BottomNavyBarItem(
                activeColor: const Color.fromRGBO(255, 102, 102, 1),
              title: const Text('我的'), icon: const Icon(Icons.face)),
          ],
      ))));
  }
}
