import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/utils/save_login_data.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashStatePage();
}

class SplashStatePage extends State<Splash> {
  Logger logger = Logger();

  @override
  void initState() {
    super.initState();
    _handleCheck();
  }

  void _handleCheck() async {
    final value = await getSharedData('name');
    if (value.isEmpty) {
      logger.e('没有数据');
      Get.toNamed('/auth');
    } else {
      logger.i(value);
      Get.toNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Image(
          image: NetworkImage('http://47.103.211.10:9090/static/images/bgcube.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
