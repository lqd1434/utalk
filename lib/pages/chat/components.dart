import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/components/rive_loading.dart';
import 'package:myapp/modules/chat.dart';
import 'package:myapp/request/my_dio.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChatBubbleLeft extends StatelessWidget {
  final String text;
  final Color color;
  final Color bgColor;
  final BubbleNip? nip;
  final Alignment? alignment;
  final ImageProvider img;
  final double? topMargin;
  final double? bottomMargin;

  const ChatBubbleLeft({
    Key? key,
    this.alignment = Alignment.centerLeft,
    this.nip,
    required this.text,
    this.bgColor = Colors.white,
    this.color = Colors.blue,
    required this.img,
    this.topMargin = 0,
    this.bottomMargin = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: topMargin!, bottom: bottomMargin!),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 2),
            margin: const EdgeInsets.only(right: 2),
            child: RadiusImage(
                radius: 8,
                widthAndHeight: 50,
                image: img,
                boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1)]),
          ),
          SizedBox(
            width: 200,
            child: Bubble(
              color: bgColor,
              margin: BubbleEdges.fromLTRB(0, topMargin, 0, bottomMargin),
              padding: const BubbleEdges.all(12),
              alignment: alignment,
              nip: nip,
              child: Text(
                text,
                style: TextStyle(color: color),
                textAlign: TextAlign.left,
              ),
              nipRadius: 4,
              nipWidth: 12,
              elevation: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubbleRight extends StatelessWidget {
  final String text;
  final Color color;
  final Color bgColor;
  final BubbleNip? nip;
  final Alignment? alignment;
  final ImageProvider img;
  final double? bottomMargin;
  final double? topMargin;

  const ChatBubbleRight({
    Key? key,
    this.alignment = Alignment.centerLeft,
    this.nip,
    required this.text,
    this.bgColor = Colors.white,
    this.color = Colors.blue,
    required this.img,
    this.bottomMargin = 0,
    this.topMargin = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, topMargin!, 0, bottomMargin!),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(child: SizedBox()),
          SizedBox(
            width: 200,
            child: Bubble(
              color: bgColor,
              margin: BubbleEdges.fromLTRB(0, topMargin, 0, bottomMargin),
              padding: const BubbleEdges.all(12),
              alignment: alignment,
              nip: nip,
              nipWidth: 12,
              child: Text(text, style: TextStyle(color: color), textAlign: TextAlign.left),
              nipRadius: 4,
              elevation: 1,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 2),
            margin: const EdgeInsets.only(left: 2),
            child: RadiusImage(
                radius: 8,
                widthAndHeight: 50,
                image: img,
                boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1)]),
          ),
        ],
      ),
    );
  }
}

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatListStatePage();
}

class _ChatListStatePage extends State<ChatList> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<ChatHistory> chatList = [];

  @override
  void initState() {
    _loadMore(count: 10);
    super.initState();
  }

  void _onRefresh() async {
    final bool result = await _loadMore();
    if (result) {
      _refreshController.headerMode!.value = RefreshStatus.completed;
    } else {
      _refreshController.headerMode!.value = RefreshStatus.failed;
    }
  }

  Future<bool> _loadMore({int count = 2}) async {
    try {
      final res = (await DioManege.getInstance().dio!.get('http://47.103.211.10:8080/msg/limit',
              queryParameters: {'count': count, 'lastId': chatList.length, 'from': 1, 'to': 2}))
          .data['list'];
      Logger().w(res);
      for (var element in res) {
        chatList.add(ChatHistory.fromJson(element));
      }
      setState(() {});
      return true;
    } catch (e) {
      Logger().e(e);
      return false;
    }
  }

  Widget _loadText(String text, Color color) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 18),
    );
  }

  Widget _loadBuilder(BuildContext context, RefreshStatus? mode) {
    if (mode == RefreshStatus.refreshing) {
      return const RiveLoading();
    } else {
      Widget body;
      if (mode == RefreshStatus.failed) {
        body = _loadText('????????????', Colors.red);
      } else if (mode == RefreshStatus.completed) {
        body = _loadText("???????????????", Colors.green);
      } else if (mode == RefreshStatus.idle) {
        body = _loadText('??????????????????', Colors.grey);
      } else {
        body = _loadText('??????????????????', Colors.blue);
      }
      return Container(height: 100, alignment: Alignment.center, child: body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: CustomHeader(refreshStyle: RefreshStyle.Behind, builder: _loadBuilder),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: chatList.isEmpty
            ? const SizedBox()
            : ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  if (chatList[index].from == 2) {
                    return ChatBubbleLeft(
                      text: chatList[index].content,
                      color: HexColor('#B2B6EB'),
                      nip: BubbleNip.leftTop,
                      bottomMargin: 15,
                      topMargin: 10,
                      alignment: Alignment.centerLeft,
                      img: const NetworkImage('http://47.103.211.10:9090/static/icons/1.jpg'),
                    );
                  } else {
                    return ChatBubbleRight(
                      text: chatList[index].content,
                      color: Colors.white,
                      bgColor: HexColor('#898FE1'),
                      nip: BubbleNip.rightTop,
                      alignment: Alignment.centerRight,
                      bottomMargin: 15,
                      topMargin: 10,
                      img: const NetworkImage('http://47.103.211.10:9090/static/images/avatar.png'),
                    );
                  }
                },
                itemCount: chatList.length,
              ));
  }
}
