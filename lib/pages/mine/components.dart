import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 75,
                alignment: Alignment.center,
                child: Text('222', style: TextStyle(fontSize: 22, color: HexColor('#7D68FF'))),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: Text('点赞', style: TextStyle(fontSize: 16, color: HexColor('#7D68FF'))),
              ),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 75,
                alignment: Alignment.center,
                child: Text('18', style: TextStyle(fontSize: 22, color: HexColor('#FFFFFF'))),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: Text('动态', style: TextStyle(fontSize: 16, color: HexColor('#FFFFFF'))),
              ),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 75,
                alignment: Alignment.center,
                child: Text('56', style: TextStyle(fontSize: 22, color: HexColor('#19E4B6'))),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: Text('关注', style: TextStyle(fontSize: 16, color: HexColor('#19E4B6'))),
              ),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 75,
                alignment: Alignment.center,
                child: Text('90', style: TextStyle(fontSize: 22, color: HexColor('#8FE1FF'))),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: Text('粉丝', style: TextStyle(fontSize: 16, color: HexColor('#8FE1FF'))),
              ),
            ]),
          ],
        ));
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
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Cell(
              onTap: () {
                Get.toNamed('/space');
              },
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
          Cell(
              onTap: () {
                Get.toNamed('/meetyou');
              },
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
          Cell(
              onTap: () {
                Get.toNamed('/working', arguments: '触人心弦');
              },
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              leftBorder: true,
              title: const Text(
                '触人心弦',
                style: TextStyle(color: Colors.deepPurple, fontSize: 20),
              ),
              icon: Icon(Icons.loyalty, color: HexColor('#FF3333'))),
          Cell(
              onTap: () {
                Get.toNamed('/happy');
              },
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              leftBorder: true,
              title: const Text(
                '每日一笑',
                style: TextStyle(color: Colors.deepPurple, fontSize: 20),
              ),
              icon: Icon(Icons.insert_emoticon, color: HexColor('#653CB3'))),
        ],
      ),
    );
  }
}
