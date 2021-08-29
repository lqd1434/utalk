import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/utils/event_bus_event.dart';
import 'package:myapp/utils/event_manage.dart';

class EventsHandle {
  static final GetxState getX = Get.find();

  static dynamic getEventByName(String eventName) {
    switch (eventName) {
      case 'ping':
        return _ping;
      case 'fullScreen':
        return _fullscreen;
      case 'requestLogin':
        return _requestLogin;
    }
  }

  static _ping(dynamic value) {
    final res = {};
    res['eventName'] = 'ping';
    res['data'] = 'success';
    final data = json.encode(res);
    getX.webViewCtr.value.future
        .then((value) => {value.evaluateJavascript("window.dispatchMyEvent('$data')")});
  }

  static _fullscreen(bool data) {
    double height = 0;
    if (data) {
      height = 0;
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
      // SystemChrome.setEnabledSystemUIOverlays([]);
    } else {
      height = 45;
    }
    EventManager.getInstance().eventBus!.fire(DoubleEvent(height));
  }

  static _requestLogin(dynamic data) {
    EventManager.getInstance().eventBus!.fire(StringEvent(data));
  }
}
