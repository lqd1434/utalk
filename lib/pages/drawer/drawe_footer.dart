import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/hex_color.dart';

class MyDrawerFooter extends StatelessWidget {
  const MyDrawerFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 60),
      decoration: const BoxDecoration(
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        color: Colors.white,
        // boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/setting');
            },
            child: Container(
              width: 70,
              height: 80,
              padding: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings, color: HexColor('#00E3E4')),
                  Text('设置', style: TextStyle(fontSize: 15, color: HexColor('#00E3E4')))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/setting');
            },
            child: Container(
              width: 70,
              height: 80,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.event_available, color: HexColor('#FF7F7E')),
                  Text('签到', style: TextStyle(fontSize: 15, color: HexColor('#FF7F7E')))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/working');
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud, color: HexColor('#6F5BC9')),
                  Text('天气', style: TextStyle(fontSize: 15, color: HexColor('#6F5BC9')))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
