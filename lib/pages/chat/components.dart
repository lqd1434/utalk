import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/utils/hex_color.dart';

class ChatBubbleLeft extends StatelessWidget {
  final String text;
  final Color color;
  final Color bgColor;
  final BubbleNip? nip;
  final Alignment? alignment;
  final ImageProvider img;
  final double? topMargin;

  const ChatBubbleLeft({
    Key? key,
    this.alignment = Alignment.centerLeft,
    this.nip,
    required this.text,
    this.bgColor = Colors.white,
    this.color = Colors.blue,
    required this.img,
    this.topMargin = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: topMargin!),
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
              margin: const BubbleEdges.only(top: 10),
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
  final double? bottomPadding;

  const ChatBubbleRight({
    Key? key,
    this.alignment = Alignment.centerLeft,
    this.nip,
    required this.text,
    this.bgColor = Colors.white,
    this.color = Colors.blue,
    required this.img,
    this.bottomPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Expanded(child: SizedBox()),
        SizedBox(
          width: 200,
          child: Bubble(
            color: bgColor,
            margin: BubbleEdges.fromLTRB(0, 10, 0, bottomPadding),
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
    );
  }
}

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatListStatePage();
}

class _ChatListStatePage extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index % 2 == 0) {
          if (index == 0) {
            return ChatBubbleLeft(
              text: '开心',
              bgColor: HexColor('#9181D6'),
              color: Colors.white,
              nip: BubbleNip.leftTop,
              topMargin: 10,
              alignment: Alignment.centerLeft,
              img: const NetworkImage('http://47.103.211.10:9090/static/images/avatar.png'),
            );
          }
          return ChatBubbleLeft(
            text: '开心',
            bgColor: HexColor('#9181D6'),
            color: Colors.white,
            nip: BubbleNip.leftTop,
            alignment: Alignment.centerLeft,
            img: const NetworkImage('http://47.103.211.10:9090/static/images/avatar.png'),
          );
        } else {
          if (index == 19) {
            return const ChatBubbleRight(
              text: '今天真的好开心',
              nip: BubbleNip.rightTop,
              alignment: Alignment.centerRight,
              bottomPadding: 10,
              img: NetworkImage('http://47.103.211.10:9090/static/images/avatar.png'),
            );
          }
          return const ChatBubbleRight(
            text: '今天真的好开心',
            nip: BubbleNip.rightTop,
            alignment: Alignment.centerRight,
            img: NetworkImage('http://47.103.211.10:9090/static/images/avatar.png'),
          );
        }
      },
      itemCount: 20,
    );
  }
}
