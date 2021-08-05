import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/cell.dart';
import 'package:myapp/utils/hex_color.dart';

class MyDrawerMenu extends StatelessWidget {
  const MyDrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Cell(
            onTap: () {
              Get.toNamed('/working', arguments: '情侣空间');
            },
            margin: const EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            boxShadowColor: Colors.transparent,
            title: const Text(
              '情侣空间',
              style: TextStyle(fontSize: 22),
            ),
            icon: Icon(Icons.favorite, color: HexColor('#E40100'))),
        Cell(
          onTap: () {
            Get.toNamed('/working', arguments: '我的收藏');
          },
          margin: const EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          boxShadowColor: Colors.transparent,
          title: const Text(
            '我的收藏',
            style: TextStyle(fontSize: 22),
          ),
          icon: Icon(Icons.library_add, color: HexColor('#00E3E4')),
        ),
        Cell(
          onTap: () {
            Get.toNamed('/working', arguments: '我的相册');
          },
          margin: const EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          boxShadowColor: Colors.transparent,
          title: const Text(
            '我的相册',
            style: TextStyle(fontSize: 22),
          ),
          icon: Icon(Icons.collections, color: HexColor('#192252')),
        ),
        Cell(
          onTap: () {
            Get.toNamed('/working', arguments: '装扮商店');
          },
          margin: const EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          boxShadowColor: Colors.transparent,
          title: const Text(
            '装扮商店',
            style: TextStyle(fontSize: 22),
          ),
          icon: Icon(Icons.palette, color: HexColor('#FFB1B1')),
        ),
        Cell(
          onTap: () {
            Get.toNamed('/working', arguments: '系统消息');
          },
          margin: const EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          boxShadowColor: Colors.transparent,
          title: const Text(
            '系统消息',
            style: TextStyle(fontSize: 22),
          ),
          icon: Icon(Icons.info, color: HexColor('#00DC88')),
        )
      ],
    );
  }
}
