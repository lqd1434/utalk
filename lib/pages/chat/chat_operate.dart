import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/hex_color.dart';

import 'chat_operate_view.dart';

class ChatSetting extends StatefulWidget {
  const ChatSetting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatSettingStatePage();
}

class _ChatSettingStatePage extends State<ChatSetting> {
  @override
  void initState() {
    super.initState();
  }

  void _deleteFriend() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("您确定要删除该好友吗?"),
            actions: <Widget>[
              TextButton(
                child: const Text("取消"),
                onPressed: () => Navigator.of(context).pop(), //关闭对话框
              ),
              TextButton(
                child: const Text("删除"),
                onPressed: () {
                  // ... 执行删除操作
                  Navigator.of(context).pop(true); //关闭对话框
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 35, color: Colors.deepPurple),
          onPressed: () {
            Get.offNamed("/chat");
          },
        ),
        title: const Text('聊天设置', style: TextStyle(color: Colors.deepPurple)),
        centerTitle: true,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 20),
            icon: const Icon(
              Icons.delete,
              size: 27,
              color: Colors.deepPurple,
            ),
            onPressed: _deleteFriend,
          )
        ],
      ),
      body: ListView(padding: EdgeInsets.zero, children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0, 1),
              )
            ],
          ),
          child: Column(
            children: [
              const ImageCell(
                  img: NetworkImage('http://47.103.211.10:9090/static/images/avatar.png'),
                  text: 'sky',
                  fontSize: 21),
              const SizedBox(height: 6),
              const Divider(),
              const SizedBox(height: 6),
              ImageCell(
                  fontSize: 17,
                  text: '发起群聊',
                  child: Icon(
                    Icons.add,
                    color: HexColor('#422CEB'),
                  )),
            ],
          ),
        ),
        const GridSetting(),
        const OpList()
      ]),
    );
  }
}
