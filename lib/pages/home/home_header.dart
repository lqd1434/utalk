import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/components/my_animation.dart';

import 'HomePage.dart';

class HomeHeader extends StatefulWidget {
  final AnimationController? animationController;
  final bool visible;
  final double topPadding;

  const HomeHeader(
      {Key? key, required this.visible, required this.topPadding, this.animationController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeHeaderStatePage();
}

class _HomeHeaderStatePage extends State<HomeHeader> {
  Logger logger = Logger();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS =
        IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  void show() {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    // flutterLocalNotificationsPlugin.show(0, 'hello', 'body', platformChannelSpecifics);
  }

  Future onDidReceiveLocalNotification(
      int i, String? payload, String? payloa3, String? payload2) async {
    print('onDidReceiveLocalNotification');
  }

  Future onSelectNotification(String? payload) async {
    print('onSelectNotification');
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    // await Navigator.push(
    //   context,
    // new MaterialPageRoute(builder: (context) => new SecondScreen(payload)),
    // );
  }

  void _handleTap() async {
    File file = File('/data/user/0/com.lqd.myapp/cache/6.jpg');
    logger.i(await file.exists());
    Uint8List bytes = await file.readAsBytes();
    logger.i(bytes);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(101, 60, 179, 1),
      child: Visibility(
          visible: widget.visible,
          maintainSize: false,
          child: Container(
            margin: EdgeInsets.fromLTRB(15, widget.topPadding, 10, 0),
            color: Colors.deepPurple,
            child: MyFadeTransition(
                myAnimationController: widget.animationController!,
                myAnimation: myAnimation(widget.animationController, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: Row(
                              children: [
                                const RadiusImage(
                                    radius: 25,
                                    widthAndHeight: 50,
                                    image: NetworkImage(
                                        'http://47.103.211.10:9090/static/images/avatar.png')),
                                Container(
                                  width: 170,
                                  padding: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text('李清栋',
                                            style: TextStyle(color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 5),
                                        alignment: Alignment.centerLeft,
                                        child: const Text('HUAWEI P30',
                                            style: TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 5),
                      child: SpeedDial(
                        icon: Icons.add,
                        foregroundColor: Colors.deepPurple,
                        spaceBetweenChildren: 6,
                        buttonSize: 50,
                        childrenButtonSize: 50,
                        childMargin: EdgeInsets.zero,
                        spacing: 3,
                        backgroundColor: Colors.white,
                        direction: SpeedDialDirection.Down,
                        renderOverlay: false,
                        elevation: 10,
                        children: [
                          SpeedDialChild(
                            child: const Icon(Icons.accessibility, color: Colors.deepPurple),
                            backgroundColor: Colors.white,
                            onTap: show,
                          ),
                          SpeedDialChild(
                            child: const Icon(Icons.brush, color: Colors.deepPurple),
                            backgroundColor: Colors.white,
                            onTap: _handleTap,
                          ),
                          SpeedDialChild(
                            child: const Icon(Icons.margin, color: Colors.deepPurple),
                            backgroundColor: Colors.white,
                            visible: true,
                            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text(("Third Child Pressed")))),
                            onLongPress: () => print('THIRD CHILD LONG PRESS'),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}
