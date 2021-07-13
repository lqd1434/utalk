// ignore_for_file: use_key_in_widget_constructors


import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:logger/logger.dart';
import 'package:myapp/pages/splash/index.dart';
import 'package:myapp/pages/welcome/welcomePage.dart';
import 'package:myapp/redux/reducer.dart';
import 'package:myapp/router/router.dart';

import 'getx/getx_state.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final GetxState getX = Get.put(GetxState());

  MyApp({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GetMaterialApp( // Before: MaterialApp(
          smartManagement: SmartManagement.keepFactory,
          defaultGlobalState: true,
          title: 'Flutter Demo',
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.white),
          home: const Splash(),
          getPages: routes,
        )
    );
  }
}

