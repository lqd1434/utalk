import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/hex_color.dart';

class DrawMenus extends StatelessWidget {
  const DrawMenus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            Container(
              width: 1,
              height: 50,
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Icon(
                Icons.library_add,
                color: Colors.white,
              ),
            ),
            Container(
              width: 1,
              height: 50,
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Icon(Icons.palette, color: Colors.white),
            ),
            Container(
              width: 1,
              height: 50,
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Icon(Icons.notifications_none, color: Colors.white),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.toNamed('/coupleSpace');
                  },
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 30),
                    width: MediaQuery.of(context).size.width - 89,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                    ),
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '情侣空间',
                      style: TextStyle(fontSize: 22, color: HexColor('#E12209')),
                    ),
                  )),
              Container(
                height: 60,
                margin: const EdgeInsets.only(bottom: 30),
                width: MediaQuery.of(context).size.width - 89,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                ),
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  '我的收藏',
                  style: TextStyle(
                    fontSize: 22,
                    color: HexColor('#15D58B'),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 89,
                margin: const EdgeInsets.only(bottom: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                ),
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  '主题切换',
                  style: TextStyle(fontSize: 22, color: HexColor('#37C5FA')),
                ),
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 89,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                ),
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  '系统消息',
                  style: TextStyle(fontSize: 22, color: HexColor('#FB9069')),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
