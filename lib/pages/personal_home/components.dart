import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/utils/hex_color.dart';

Widget getBgImg() {
  return Container(
    height: 235,
    margin: const EdgeInsets.only(top: 0),
    child: const Image(
      image: NetworkImage('http://47.103.211.10:9090/static/images/view.jpg'),
      fit: BoxFit.cover,
    ),
  );
}

Widget getApprove() {
  return Column(
    children: const [
      Icon(
        FontAwesomeIcons.solidThumbsUp,
        color: Colors.amberAccent,
      ),
      SizedBox(height: 5),
      Text(
        '77789',
        style: TextStyle(
            fontSize: 14, letterSpacing: 0, fontWeight: FontWeight.w500, color: Colors.amberAccent),
      )
    ],
  );
}

Widget getNumberInfo() {
  return SizedBox(
    child: Column(
      children: const [
        Text(
          'QQ:1434288209',
          style: TextStyle(
              fontSize: 14, letterSpacing: 0, fontWeight: FontWeight.w500, color: Colors.black),
        )
      ],
    ),
  );
}

Widget getUserIcon() {
  return RadiusImage(
    border: Border.all(color: Colors.deepPurple),
    widthAndHeight: 80,
    radius: 40,
    image: const NetworkImage('http://47.103.211.10:9090/static/images/avatar.png'),
  );
}

Widget getUserName() {
  return const Text(
    'sky',
    style:
        TextStyle(fontSize: 21, letterSpacing: 1, fontWeight: FontWeight.w500, color: Colors.black),
  );
}

Widget getNickName() {
  return Row(
    children: [
      FaIcon(
        FontAwesomeIcons.edit,
        color: HexColor('#666666'),
        size: 18,
      ),
      Container(
        padding: const EdgeInsets.only(left: 11),
        width: 290,
        child: Text(
          'sky',
          style: TextStyle(fontSize: 16, color: HexColor('#666666')),
        ),
      ),
      FaIcon(
        FontAwesomeIcons.chevronRight,
        color: HexColor('#666666'),
        size: 18,
      ),
    ],
  );
}

Widget getSignText() {
  return Row(
    children: [
      FaIcon(
        FontAwesomeIcons.signature,
        color: HexColor('#666666'),
        size: 18,
      ),
      Container(
        padding: const EdgeInsets.only(left: 11, right: 40),
        width: 290,
        child: Text(
          '个性签名: 这一次,我终究还是来得太迟',
          style:
              TextStyle(fontSize: 16, color: HexColor('#666666'), overflow: TextOverflow.ellipsis),
        ),
      ),
      FaIcon(FontAwesomeIcons.chevronRight, color: HexColor('#666666'), size: 18),
    ],
  );
}

Widget getSpace() {
  return Row(
    children: [
      FaIcon(FontAwesomeIcons.star, color: HexColor('#666666'), size: 18),
      Container(
        padding: const EdgeInsets.only(left: 11, right: 40),
        width: 290,
        child: Text(
          '他的空间',
          style:
              TextStyle(fontSize: 16, color: HexColor('#666666'), overflow: TextOverflow.ellipsis),
        ),
      ),
      FaIcon(FontAwesomeIcons.chevronRight, color: HexColor('#666666'), size: 18),
    ],
  );
}

Widget getGallery() {
  return GestureDetector(
    onTap: () {
      Get.toNamed('/gallery');
    },
    child: Row(
      children: [
        FaIcon(FontAwesomeIcons.clone, color: HexColor('#666666'), size: 18),
        Container(
          padding: const EdgeInsets.only(left: 11, right: 40),
          width: 260,
          child: Text(
            '个人画廊',
            style: TextStyle(
                fontSize: 16, color: HexColor('#666666'), overflow: TextOverflow.ellipsis),
          ),
        ),
        Text(
          '5张',
          style:
              TextStyle(fontSize: 15, color: HexColor('#666666'), overflow: TextOverflow.ellipsis),
        ),
        const SizedBox(width: 10),
        FaIcon(FontAwesomeIcons.chevronRight, color: HexColor('#666666'), size: 18),
      ],
    ),
  );
}

Widget getPictures() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          FaIcon(FontAwesomeIcons.images, color: HexColor('#666666'), size: 18),
          Container(
            padding: const EdgeInsets.only(left: 11, right: 40),
            width: 290,
            child: Text(
              '精选照片',
              style: TextStyle(
                  fontSize: 16, color: HexColor('#666666'), overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
      Container(
        height: 220,
        width: 330,
        margin: const EdgeInsets.only(right: 20, top: 20),
        color: Colors.blue,
        child: Row(
          children: [
            Container(
              height: 220,
              width: 220,
              color: HexColor('#6C8DE7'),
            ),
            Column(
              children: [
                Container(
                  height: 110,
                  width: 110,
                  color: Colors.blueGrey,
                ),
                Container(
                  height: 110,
                  width: 110,
                  color: HexColor('#98EEAC'),
                ),
              ],
            )
          ],
        ),
      )
    ],
  );
}
