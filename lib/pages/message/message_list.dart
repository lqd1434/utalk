import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:myapp/components/swiper_action.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MessageListStatePage();
}

class MessageListStatePage extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemBuilder: (BuildContext context, int index) {
        return SwiperAction(
          valueKey: ValueKey(index),
          child: const ListTile(
            leading: GFAvatar(),
            title: Text('lqd'),
            isThreeLine: false,
            subtitle: Text('今天真的好开心!', softWrap: false, overflow: TextOverflow.ellipsis),
          ),
        );
      },
      itemCount: 20,
    );
  }
}
