import 'package:flutter/material.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/save_login_data.dart';
import 'package:shimmer/shimmer.dart';

import 'message_list_view.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MessageListStatePage();
}

class MessageListStatePage extends State<MessageList> with TickerProviderStateMixin {
  Future<String> _getMessageList() async {
    return Future.delayed(const Duration(seconds: 2), () {
      setSharedDataForString('cache', 'true');
      return '11';
    });
  }

  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getMessageList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            // 请求失败，显示错误
            return Text("Error: ${snapshot.error}");
          } else {
            // 请求成功，显示数据
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 15),
                        width: MediaQuery.of(context).size.width - 280,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              height: 65,
                              width: 65,
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: HexColor('#7F7FDA')),
                                color: HexColor('#5757CF').withOpacity(0.5),
                              ),
                              child: Stack(
                                children: const [
                                  Positioned(
                                    top: 2,
                                    left: 6,
                                    child: Text(
                                      '特别',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18, letterSpacing: 4),
                                    ),
                                  ),
                                  Positioned(
                                      top: 22,
                                      left: 16,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                      )),
                                  Positioned(
                                    bottom: 2,
                                    left: 6,
                                    child: Text(
                                      '关心',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18, letterSpacing: 4),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                    Container(
                      height: 60,
                      alignment: Alignment.center,
                      width: 280,
                      margin: const EdgeInsets.only(top: 15),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(right: 16, left: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
                              .animate(CurvedAnimation(
                                  parent: animationController!,
                                  curve: Interval((1 / 10) * index, 1.0,
                                      curve: Curves.fastOutSlowIn)));
                          animationController?.forward();
                          return Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: AnimatedBuilder(
                              animation: animation,
                              builder: (BuildContext context, Widget? child) {
                                return FadeTransition(
                                    opacity: animation,
                                    child: Transform(
                                        transform: Matrix4.translationValues(
                                            100 * (1.0 - animation.value), 0.0, 0.0),
                                        child: child));
                              },
                              child: index == 9
                                  ? Container(
                                      width: 60,
                                      height: 60,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: HexColor('#7F7FDA')),
                                          color: HexColor('#E9EDF7').withOpacity(0.5),
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.add,
                                        size: 30,
                                        color: HexColor('#7F7FDA'),
                                      ),
                                    )
                                  : RadiusImage(
                                      border: Border.all(color: HexColor('#7F7FDA')),
                                      widthAndHeight: 60,
                                      radius: 30,
                                      image: const NetworkImage(
                                        'http://47.103.211.10:9090/static/images/avatar.png',
                                      ),
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Expanded(child: MessageListView()),
              ],
            );
          }
        } else {
          // 请求未结束，显示loading
          return RepaintBoundary(child: loadingShimmer());
        }
      },
    );
  }
}

Widget loadingShimmer() {
  return Container(
    width: double.maxFinite,
    padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
    child: Shimmer.fromColors(
        baseColor: HexColor('#8186E2'),
        highlightColor: HexColor('#FFFFFF'),
        direction: ShimmerDirection.ltr,
        loop: 100,
        period: const Duration(seconds: 2),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.only(right: 10),
                        decoration:
                            BoxDecoration(color: HexColor('#9E80D5'), shape: BoxShape.circle),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 70,
                            height: 20,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: HexColor('#9E80D5'), borderRadius: BorderRadius.circular(3)),
                          ),
                          Container(
                            width: 150,
                            height: 16,
                            decoration: BoxDecoration(
                                color: HexColor('#9E80D5'), borderRadius: BorderRadius.circular(3)),
                          )
                        ],
                      )
                    ],
                  ));
            })),
  );
}
