// ignore_for_file: use_key_in_widget_constructors

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/pages/splash/index.dart';
import 'package:myapp/router/router.dart';

import 'getx/getx_state.dart';
import 'hive/adapter/user_adapter.dart';

void main() async {
  Hive.registerAdapter(UserAdapter());
  await Hive.initFlutter();
  await Hive.openBox<User>('userBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final GetxState getX = Get.put(GetxState());

  @override
  Widget build(BuildContext context) {
    GestureBinding.instance!.resamplingEnabled = true;
    // 除半透明状态栏
    if (Theme.of(context).platform == TargetPlatform.android) {
      // android 平台
      SystemUiOverlayStyle _style = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(_style);
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GetMaterialApp(
            smartManagement: SmartManagement.keepFactory,
            defaultGlobalState: true,
            title: 'Utalk',
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
            home: const Splash(),
            getPages: routes,
            routingCallback: (routing) {
              print('-----路由变化-----');
              print('-----$routing-----');
            }));
  }
}
