import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

class StatesHandle {
  static final GetxState getX = Get.find();

  static dynamic getStateByName(String eventName) {
    switch (eventName) {
      case 'appInfo':
        return _appInfo;
      case 'userInfo':
        return _userInfo;
      case 'network':
        return _network;
      case 'safeArea':
        return _safeArea;
    }
  }

  static _appInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final appInfo = {};
    appInfo['appName'] = packageInfo.appName;
    appInfo['version'] = packageInfo.version;
    final res = {};
    res['eventName'] = 'appInfo';
    res['data'] = appInfo;
    final data = json.encode(res);
    getX.webViewCtr.value.future
        .then((value) => {value.evaluateJavascript("window.dispatchMyEvent('$data')")});
  }

  static _userInfo() {
    final data = getX.userInfo.value;
    getX.webViewCtr.value.future
        .then((value) => {value.evaluateJavascript("window.dispatchMyEvent('$data')")});
  }

  static _network() {
    // EventManager.getInstance().eventBus!.fire(StringEvent(data));
  }

  static _safeArea() {
    final res = {};
    res['eventName'] = 'safeArea';
    res['data'] = 25;
    final data = json.encode(res);
    getX.webViewCtr.value.future
        .then((value) => {value.evaluateJavascript("window.dispatchMyEvent('$data')")});
  }
}
