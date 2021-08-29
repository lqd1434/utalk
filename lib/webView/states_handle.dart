import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/utils/event_bus_event.dart';
import 'package:myapp/utils/event_manage.dart';

class StatesHandle {
  static final GetxState getX = Get.find();

  static dynamic getStateByName(String eventName) {
    switch (eventName) {
      case 'version':
        return _version;
      case 'userInfo':
        return _userInfo;
      case 'network':
        return _network;
    }
  }

  static _version(dynamic value) {
    final res = {};
    res['eventName'] = 'ping';
    res['data'] = value;
    final data = json.encode(res);
    getX.webViewCtr.value.future
        .then((value) => {value.evaluateJavascript("window.dispatchMyEvent('$data')")});
  }

  static _userInfo(bool data) {
    double height = 0;
    if (data) {
      height = 0;
    } else {
      height = 45;
    }
    EventManager.getInstance().eventBus!.fire(DoubleEvent(height));
  }

  static _network(dynamic data) {
    EventManager.getInstance().eventBus!.fire(StringEvent(data));
  }
}
