import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoupleSpace extends StatefulWidget {
  const CoupleSpace({Key? key}) : super(key: key);

  @override
  _CoupleSpaceState createState() => _CoupleSpaceState();
}

class _CoupleSpaceState extends State<CoupleSpace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
          onPressed: () {
            Get.toNamed("/chat");
          },
        ),
        title: const Text('情侣❤️空间'),
        centerTitle: true,
      ),
      body: Text('body'),
    );
  }
}
