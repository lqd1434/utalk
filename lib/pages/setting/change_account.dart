import 'package:flutter/material.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/read_file.dart';

class AccountRow extends StatelessWidget {
  const AccountRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context, 'sky');
              },
              child: Column(
                children: [
                  RadiusImage(widthAndHeight: 60, radius: 30, image: MemoryImage(loadIcon())),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    'sky',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context, 'bob');
              },
              child: Column(
                children: [
                  RadiusImage(widthAndHeight: 60, radius: 30, image: MemoryImage(loadIcon())),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    'bob',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
        ),
        SizedBox(
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context, 'bob');
              },
              child: Column(
                children: [
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 7),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: HexColor('#E9EDF7'), shape: BoxShape.circle),
                    child: const Icon(Icons.add, size: 30),
                  ),
                  const Text(
                    '添加',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
