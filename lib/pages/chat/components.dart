
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/modules/message.dart';
import 'package:myapp/socket/index.dart';

import 'index.dart';

class ChatBubbleLeft extends StatefulWidget{
  final dynamic text;
  final Color color;
  final Color bgColor;
  final BubbleNip? nip;
  final Alignment? alignment;
  final ImageProvider img;
  const ChatBubbleLeft({Key? key,
    this.alignment=Alignment.centerLeft,
    this.nip, this.text,
    this.bgColor=Colors.white,
    this.color=Colors.blue,
    required this.img,
  }):super(key: key);

  @override
  State<StatefulWidget> createState()=>ChatBubbleLeftStatePage();

}

class ChatBubbleLeftStatePage extends State<ChatBubbleLeft>{

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         RadiusImage(
            radius: 8,
            widthAndHeight: 50,
            image: widget.img
        ),
        SizedBox(
          width: 200,
          child: Bubble(
            color:widget.bgColor,
            margin: const BubbleEdges.only(top: 10),
            padding: const BubbleEdges.all(12),
            alignment: widget.alignment,
            nip: widget.nip,
            child:Text(widget.text,
              style: TextStyle(color: widget.color),
              textAlign:TextAlign.left,),
            nipRadius: 4,
            nipWidth: 12,
            elevation: 1,
          ),
        ),
      ],
    );
  }
}


class ChatBubbleRight extends StatefulWidget{
  final dynamic text;
  final Color color;
  final Color bgColor;
  final BubbleNip? nip;
  final Alignment? alignment;
  final ImageProvider img;
  final double? bottomPadding;
  const ChatBubbleRight({Key? key,
    this.alignment=Alignment.centerLeft,
    this.nip, this.text,
    this.bgColor=Colors.white,
    this.color=Colors.blue,
    required this.img,
    this.bottomPadding=0,
  }):super(key: key);

  @override
  State<StatefulWidget> createState()=>ChatBubbleRightStatePage();

}

class ChatBubbleRightStatePage extends State<ChatBubbleRight>{

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
            color:widget.bgColor,
            margin: BubbleEdges.fromLTRB(0,10,0,widget.bottomPadding),
            padding: const BubbleEdges.all(12),
            alignment: widget.alignment,
            nip: widget.nip,
            nipWidth: 12,
            child:Text(widget.text,
              style: TextStyle(color: widget.color),
              textAlign:TextAlign.left),
            nipRadius: 4,
            elevation: 1,
          ),
        ),
        RadiusImage(
            radius: 8,
            widthAndHeight: 50,
            image: widget.img
        ),
      ],
    );
  }
}

class ChatBottom extends StatefulWidget {
  final double bottomPadding;
  final TextEditingController? controller;
  const ChatBottom({Key? key, required this.bottomPadding, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChatBottomStatePage();
}

class ChatBottomStatePage extends State<ChatBottom> {

  void handleSend(){
    final MessageBody message = MessageBody('1', '2', 'hello');
    sendMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomPadding),
      child: Container(
          height: 95,
          color: const Color.fromRGBO(233, 245, 254, 1),
          padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: widget.controller,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(8,0,0,0),
                            fillColor: Colors.white,
                            filled: true,
                            border: inputBorder,
                            focusedBorder: inputBorder,
                            enabledBorder: inputBorder,
                          ),
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15),
                    width: 100,
                    child: GFButton(
                      onPressed: handleSend,
                      text: "发送",
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 16, 0),
                    child: Icon(Icons.mic),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Icon(Icons.image),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Icon(Icons.photo_camera),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Icon(Icons.image),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Icon(Icons.add_circle),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                    child: Icon(Icons.delete),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MessageListStatePage();
}

class MessageListStatePage extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index % 2 == 0) {
          return const ChatBubbleLeft(
            text: '开心',
            nip: BubbleNip.leftTop,
            alignment: Alignment.centerLeft,
            img: AssetImage('static/images/avatar.png'),
          );
        } else {
          if (index == 19) {
            return const ChatBubbleRight(
              text: '今天真的好开心',
              nip: BubbleNip.rightTop,
              alignment: Alignment.centerRight,
              bottomPadding: 10,
              img: AssetImage('static/images/avatar.png'),
            );
          }
          return const ChatBubbleRight(
            text: '今天真的好开心',
            nip: BubbleNip.rightTop,
            alignment: Alignment.centerRight,
            img:  AssetImage('static/images/avatar.png'),
          );
        }
      },
      itemCount: 20,
    );
  }
}
