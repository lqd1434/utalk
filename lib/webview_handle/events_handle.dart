import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/pages/webviewPage/webview_toast.dart';
import 'package:myapp/utils/event_bus_event.dart';
import 'package:myapp/utils/event_manage.dart';

class EventsHandle {
  static final GetxState getX = Get.find();
  static Logger logger = Logger();

  static dynamic getEventByName(String eventName) {
    switch (eventName) {
      case 'ping':
        return _ping;
      case 'fullScreen':
        return _fullscreen;
      case 'requestLogin':
        return _requestLogin;
      case 'loadingToast':
        return _loading;
      case 'cancelToast':
        return _cancelToast;
      case 'successToast':
        return _success;
      case 'errorToast':
        return _error;
      case 'waringToast':
        return _waring;
    }
  }

  /// 连接函数
  static _ping(BuildContext context, dynamic value) {
    final res = {};
    res['eventName'] = 'ping';
    res['data'] = 'success';
    final data = json.encode(res);
    getX.webViewCtr.value.future
        .then((value) => {value.evaluateJavascript("window.dispatchMyEvent('$data')")});
  }

  /// 全屏函数
  static _fullscreen(BuildContext context, Map<String, dynamic> dataMap) {
    double height = 0;
    final showStatusBar = dataMap['showStatusBar'];
    final showAppBar = dataMap['showAppBar'];
    if (showStatusBar && showAppBar) {
      height = 45;
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
    } else if (showStatusBar && !showAppBar) {
      height = 0;
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
    } else if (!showStatusBar && showAppBar) {
      height = 45;
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    } else if (!showStatusBar && !showAppBar) {
      height = 0;
      SystemChrome.setEnabledSystemUIOverlays([]);
    }
    EventManager.getInstance().eventBus!.fire(DoubleEvent(height));
  }

  static _requestLogin(BuildContext context, dynamic data) {
    EventManager.getInstance().eventBus!.fire(StringEvent(data));
  }

  static _loading(BuildContext context, dynamic data) {
    WebViewToast.showLoading(context);
  }

  static _cancelToast(BuildContext context, dynamic data) {
    WebViewToast.cancelToast(context);
  }

  static _success(BuildContext context, String data) {
    WebViewToast.showInfo(context, 'success', data);
  }

  static _error(BuildContext context, String data) {
    WebViewToast.showInfo(context, 'error', data);
  }

  static _waring(BuildContext context, String data) {
    WebViewToast.showInfo(context, 'waring', data);
  }
}
