import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/src/response.dart' as Res;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/components/my_animation.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/read_file.dart';
import 'package:myapp/utils/save_login_data.dart';

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
  Uint8List? myIconBytes;
  final GetxState getX = Get.find();

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    File file = await readMyIcon();
    if (file.existsSync()) {
      Uint8List bytes = await file.readAsBytes();
      getX.setIcon(file.path);
      setState(() {
        myIconBytes = bytes;
      });
    } else {
      // String icon = getX.userInfo.value.icon;
      String icon = await getSharedData('icon');
      final bytes = await compute(loadRive, icon);
      File overFile = await file.writeAsBytes(bytes);
      getX.setIcon(overFile.path);
      setState(() {
        myIconBytes = bytes;
      });
    }
  }

  //  线程隔离（Isolate）使用
  static Future<Uint8List> loadRive(String icon) async {
    String url = 'http://47.103.211.10:9090/static/icons/$icon';
    Dio dio = Dio();
    dio.options.responseType = ResponseType.bytes;
    Res.Response response = await dio.get(url);
    final Uint8List uint8List = response.data;
    // final bytes = ByteData.view(uint8List.buffer);
    dio.close();
    return uint8List;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#7F7FDA'),
      child: Visibility(
          visible: widget.visible,
          maintainSize: false,
          child: Container(
            margin: EdgeInsets.fromLTRB(15, widget.topPadding, 10, 0),
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
                                myIconBytes == null
                                    ? const SizedBox(width: 50)
                                    : RadiusImage(
                                        radius: 25,
                                        widthAndHeight: 50,
                                        image: MemoryImage(myIconBytes!),
                                      ),
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
                              onTap: () {
                                Get.toNamed('/webview');
                              }),
                          SpeedDialChild(
                              child: const Icon(Icons.brush, color: Colors.deepPurple),
                              backgroundColor: Colors.white,
                              onTap: () {
                                Get.toNamed('/test');
                              }),
                          SpeedDialChild(
                            child: const Icon(Icons.margin, color: Colors.deepPurple),
                            backgroundColor: Colors.white,
                            visible: true,
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
