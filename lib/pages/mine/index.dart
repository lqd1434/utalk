import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/getwidget.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/cell.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/components/swiper_action.dart';
import 'package:get/get.dart';
import 'package:myapp/getx/getx_state.dart';

import 'components.dart';

class Mine extends StatefulWidget {
  final AnimationController? animationController;

  const Mine({Key? key, this.animationController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MineStatePage();
}

class MineStatePage extends State<Mine> {
  final Logger logger = Logger();

  _handleBack() {
    Navigator.popAndPushNamed(context, '/home');
  }

  final GetxState gexState = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => {gexState.changeIsShowAppBar(false)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Container(
            child: Column(
          children: [
            Container(
              height: 160,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
              margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          padding: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            '李清栋',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const MyCountInfo()
                      ],
                    ),
                  ),
                  Container(
                    width: 130,
                    child: const RadiusImage(
                      image: AssetImage('static/images/avatar.png'),
                      widthAndHeight: 110,
                      radius: 55,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white),
            const SizedBox(height: 20),
            const Flexible(child: MineCellGroup()),
          ],
        )));
  }
}
