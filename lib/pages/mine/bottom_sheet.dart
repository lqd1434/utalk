import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/hex_color.dart';

typedef PickFunc = void Function(int choice);

dynamic choiceSheet(PickFunc pick) {
  return Container(
    alignment: Alignment.center,
    height: 240,
    color: HexColor('#E8E8E8'),
    child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 13),
          margin: const EdgeInsets.only(bottom: 10),
          width: double.maxFinite,
          color: Colors.white,
          child: const Text(
            '上传图片',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          color: Colors.white,
          width: double.maxFinite,
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                  pick(1);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text(
                    '相册',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 0,
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  pick(2);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text(
                    '拍照',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          width: double.maxFinite,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                '取消',
                style: TextStyle(fontSize: 20, color: HexColor('#F73C3C')),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
