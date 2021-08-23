import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/socket/index.dart';
import 'package:myapp/utils/event_bus_event.dart';
import 'package:myapp/utils/event_manage.dart';
import 'package:myapp/utils/save_login_data.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashStatePage();
}

class SplashStatePage extends State<Splash> {
  Logger logger = Logger();
  final GetxState getX = Get.find();

  @override
  void initState() {
    super.initState();
    _handleCheck();
  }

  void _handleCheck() async {
    final value = await getSharedData('name');
    if (value.isEmpty) {
      Get.toNamed('/auth');
    } else {
      doConn();
      EventManager.getInstance().eventBus!.on<StringEvent>().listen((event) {
        Get.offAllNamed('/home');
      });
    }
  }

  Future<void> doConn() async {
    final name = await getSharedData('name');
    final id = int.parse(await getSharedData('id'));
    final conn = await useSocket(id);
    if (getX.socket.value == null && name != '') {
      conn();
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
