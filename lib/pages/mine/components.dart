import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/components/cell.dart';
import 'package:myapp/utils/hex_color.dart';

class MyCountInfo extends StatefulWidget {
  const MyCountInfo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyCountInfoStatePage();
}

class MyCountInfoStatePage extends State<MyCountInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('222', style: TextStyle(fontSize: 22, color: Colors.orange)),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('15', style: TextStyle(fontSize: 22, color: Colors.green)),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('88', style: TextStyle(fontSize: 22, color: Colors.blue)),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('15', style: TextStyle(fontSize: 22, color: Colors.red)),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('点赞', style: TextStyle(fontSize: 16, color: Colors.orange)),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('动态', style: TextStyle(fontSize: 16, color: Colors.green)),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('关注', style: TextStyle(fontSize: 16, color: Colors.blue)),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('粉丝', style: TextStyle(fontSize: 16, color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MineCellGroup extends StatefulWidget {
  const MineCellGroup({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MineCellGroupStatePage();
}

class MineCellGroupStatePage extends State<MineCellGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(241, 242, 249, 1),
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Cell(
                leftBorder: true,
                title: const Text(
                  '好友动态',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                ),
                icon: Icon(
                  Icons.star,
                  color: HexColor('#FF7F00'),
                  size: 28,
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Cell(
                leftBorder: true,
                title: const Text(
                  '与你相遇',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                ),
                icon: Icon(
                  Icons.public,
                  color: HexColor('#00E3E4'),
                  size: 28,
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Cell(
                leftBorder: true,
                title: const Text(
                  '触人心弦',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                ),
                icon: Icon(Icons.loyalty, color: HexColor('#FF3333'))),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Cell(
                leftBorder: true,
                title: const Text(
                  '每日一笑',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                ),
                icon: Icon(Icons.insert_emoticon, color: HexColor('#653CB3'))),
          ),
        ],
      ),
    );
  }
}
