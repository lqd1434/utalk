import 'package:flutter/material.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/save_login_data.dart';
import 'package:shimmer/shimmer.dart';

import 'message_list_view.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MessageListStatePage();
}

class MessageListStatePage extends State<MessageList> {
  Future<String> _getMessageList() async {
    return Future.delayed(const Duration(seconds: 2), () {
      setSharedDataForString('cache', 'true');
      return '11';
    });
  }

  @override
  void initState() {
    super.initState();
    getSharedData('cache').then((value) => {});
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
            return const MessageListView();
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
    padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
