// ignore_for_file: use_key_in_widget_constructors

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myapp/pages/splash/index.dart';
import 'package:myapp/router/router.dart';

import 'getx/getx_state.dart';

void main() {
  // if (kDebugMode) {
  //   PluginManager.instance! // 注册插件
  //     ..register(const WidgetInfoInspector())
  //     ..register(const WidgetDetailInspector())
  //     ..register(const ColorSucker())
  //     ..register(AlignRuler())
  //     ..register(Performance())
  //     ..register(const ShowCode())
  //     ..register(const MemoryInfoPage())
  //     ..register(CpuInfoPage())
  //     ..register(const DeviceInfoPanel())
  //     ..register(Console());
  //   runApp(injectUMEWidget(child: MyApp(), enable: true)); // 初始化
  // } else {
  runApp(MyApp());
  // }
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
