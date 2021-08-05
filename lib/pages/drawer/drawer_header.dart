import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/read_file.dart';

class MyDrawerHeader extends StatelessWidget {
  MyDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    radius: 40,
                    widthAndHeight: 80,
                    border: Border.all(color: HexColor('#653CB3')),
                    image: MemoryImage(loadIcon())))),
        const SizedBox(width: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('sky', style: TextStyle(fontSize: 22, color: HexColor('#653CB3'))),
            const SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: Text('一个人的爱总是如此的无力',
                  style: TextStyle(fontSize: 16, color: HexColor('#F6D8CE')),
                  overflow: TextOverflow.ellipsis),
            )
          ],
        )
      ],
    );
  }
}
