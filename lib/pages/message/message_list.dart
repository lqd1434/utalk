import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myapp/components/list_tile.dart';
import 'package:myapp/components/swiper_action.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:shimmer/shimmer.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MessageListStatePage();
}

class MessageListStatePage extends State<MessageList> {
  Future<String> _getMessageList() async {
    return Future.delayed(const Duration(seconds: 3), () => "我是从互联网上获取的数据");
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
            return messageListView();
          }
        } else {
          // 请求未结束，显示loading
          return loadingShimmer();
        }
      },
    );
  }
}

Widget loadingShimmer() {
  return Container(
    width: double.maxFinite,
    margin: const EdgeInsets.only(top: 10, left: 10),
    child: Shimmer.fromColors(
        baseColor: HexColor('#CCCCCC'),
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

Widget messageListView() {
  return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, bottom: 65),
      padding: EdgeInsets.zero,
      child: AnimationLimiter(
        child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: SwiperAction(
                          valueKey: ValueKey(index),
                          child: UserTile(
                            image: const NetworkImage(
                              'http://47.103.211.10:9090/static/images/avatar.png',
                            ),
                            title: Text('sky',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: HexColor('#653CB3'),
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5)),
                            subText: Text('今天真的好开心!',
                                style: TextStyle(fontSize: 13, color: HexColor('#8C9EE9')),
                                softWrap: false,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      )));
            }),
      ));
}
