import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class FriendList<T> extends StatefulWidget {
  final T? items;
  const FriendList({Key? key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FriendListStatePage();
}

class FriendListStatePage extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
      itemBuilder: (BuildContext context, int index) {
        return const GFListTile(
          avatar: GFAvatar(),
          titleText: 'lqd',
          subTitleText: 'welcome to new york',
        );
      },
      itemCount: 10,
    )
    );
  }
}
