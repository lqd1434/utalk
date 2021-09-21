import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/utils/hex_color.dart';

Widget webviewSheet(VoidCallback fullscreen) {
  return Container(
    height: 260,
    decoration: BoxDecoration(
        color: HexColor('#E6EBEC'),
        borderRadius:
            const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          height: 100,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return sheetItem(fullscreen);
            },
          ),
        ),
        const Divider(),
        Container(
          margin: const EdgeInsets.only(top: 15),
          height: 100,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return sheetItem(fullscreen);
            },
          ),
        ),
      ],
    ),
  );
}

Widget sheetItem(VoidCallback fullscreen) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          fullscreen();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: 70,
          width: 70,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: const Icon(
            Icons.fullscreen,
            size: 40,
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      const Text(
        '进入全屏',
        style: TextStyle(fontSize: 13, color: Colors.black),
      )
    ],
  );
}
