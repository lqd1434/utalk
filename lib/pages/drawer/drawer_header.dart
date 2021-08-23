import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/read_file.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          gradient:
              LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
            HexColor('#D8DAF8'),
            HexColor('#8287E5'),
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 15),
          GestureDetector(
              onTap: () {
                Get.toNamed('/personalHome', arguments: '/personalHome');
              },
              child: Hero(
                  tag: 'hero',
                  child: RadiusImage(
                      radius: 30,
                      widthAndHeight: 60,
                      boxShadow: [BoxShadow(color: HexColor('#EEF3FB'), blurRadius: 5)],
                      image: MemoryImage(loadIcon())))),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('sky',
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, color: HexColor('#8289E8'))),
              const SizedBox(height: 10),
              SizedBox(
                width: 150,
                child: Text('一个人的爱总是如此的无力',
                    style: TextStyle(fontSize: 16, color: HexColor('#F5F5FD')),
                    overflow: TextOverflow.ellipsis),
              )
            ],
          )
        ],
      ),
    );
  }
}
