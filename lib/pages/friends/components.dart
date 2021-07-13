

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:myapp/components/friend_list.dart';
import 'package:myapp/pages/chat/index.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) :super(key: key);

  @override
  State<StatefulWidget> createState() => SearchStatePage();

}

class SearchStatePage extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
          color: const Color.fromRGBO(225, 225, 250, 1),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: Row(
            children: [
              Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: '请输入搜索内容',
                          labelStyle: const TextStyle(color: Colors.grey),
                          contentPadding: const EdgeInsets.fromLTRB(8,0,0,0),
                          fillColor: Colors.white,
                          filled: true,
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          floatingLabelBehavior: FloatingLabelBehavior.never
                      ),
                    ),
                  )
              ),
            ],
          ),
        );
  }
}

class OnlineFriends extends StatefulWidget {
  const OnlineFriends({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StatePage();
}

class StatePage extends State<OnlineFriends> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FriendList()
    );
  }
}

class AllFriends extends StatefulWidget {
  const AllFriends({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AllFriendsStatePage();
}

class AllFriendsStatePage extends State<AllFriends> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const FriendList()
    );
  }
}

class ChatGroup extends StatefulWidget {
  const ChatGroup({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChatGroupStatePage();
}

class ChatGroupStatePage extends State<ChatGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const FriendList()
    );
  }
}

class SpecialPerson extends StatefulWidget {
  const SpecialPerson({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SpecialPersonStatePage();
}

class SpecialPersonStatePage extends State<SpecialPerson> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const FriendList()
    );
  }
}