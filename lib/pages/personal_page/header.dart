import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/utils/hex_color.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 20),
          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: IconButton(
              onPressed: () {
                Get.toNamed(Get.previousRoute);
              },
              icon: const Icon(
                Icons.chevron_left,
                size: 30,
                color: Colors.grey,
              )),
        ),
        Container(
          height: 80,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 10),
          child: Hero(
            tag: 'hero',
            child: RadiusImage(
              widthAndHeight: 70,
              radius: 35,
              boxShadow: [
                BoxShadow(color: HexColor('#ADB1F0'), blurRadius: 20, offset: const Offset(0, 10))
              ],
              image: const NetworkImage('http://47.103.211.10:9090/static/icons/1.jpg'),
            ),
          ),
        )
      ],
    );
  }
}
