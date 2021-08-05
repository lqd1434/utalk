import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/hex_color.dart';

class BackBtn extends StatelessWidget {
  final String path;

  const BackBtn({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: HexColor('#C6C0F3'),
      onPressed: () {
        Get.offAndToNamed(path);
      },
      icon: const Icon(
        Icons.chevron_left,
        size: 35,
      ),
    );
  }
}
