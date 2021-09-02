import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/modules/message.dart';
import 'package:myapp/socket/index.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/save_login_data.dart';

class ChatBottom extends StatefulWidget {
  final double bottomPadding;
  final TextEditingController? controller;

  const ChatBottom({Key? key, required this.bottomPadding, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChatBottomStatePage();
}

class ChatBottomStatePage extends State<ChatBottom> {
  void handleSend() async {
    final String id = await getSharedData('id');
    final MessageBody message = MessageBody(id, Get.arguments.id.toString(), 'hello');
    sendMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 95,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: widget.bottomPadding),
        decoration: BoxDecoration(
            color: HexColor('#FFFFFF'),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 3)]),
        padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10, left: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 120,
                    height: 40,
                    child: TextField(
                      controller: widget.controller,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        fillColor: Colors.white,
                        filled: true,
                        border: inputBorder,
                        focusedBorder: inputBorder,
                        enabledBorder: inputBorder,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: 100,
                    child: GestureDetector(
                      onTap: handleSend,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
                            color: HexColor('#898FE1'),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "发送",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.crop_original),
                  Icon(Icons.filter_center_focus),
                  Icon(Icons.mood),
                  Icon(Icons.dehaze),
                ],
              ),
            )
          ],
        ));
  }
}

InputBorder inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    width: 1,
    color: HexColor('#898FE1'),
  ),
);
