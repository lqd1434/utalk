import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/webView/res_from_js.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'events_handle.dart';
import 'states_handle.dart';

class WebviewUtils {
  WebviewUtils();

  static Logger logger = Logger();
  static final GetxState getX = Get.find();

  static handleEvent(Completer<WebViewController> webViewController, ResFromJs resFromJs) {
    EventsHandle.getEventByName(resFromJs.name!)(resFromJs.data);
  }

  static handleState(Completer<WebViewController> webViewController, ResFromJs resFromJs) {
    StatesHandle.getStateByName(resFromJs.name!);
  }

  static handleMessage(Completer<WebViewController> webViewController, Map message) {
    var res = ResFromJs.fromJson(message);
    logger.i(res.name);
    if (res.type == 'event') {
      handleEvent(webViewController, res);
    } else if (res.type == 'state') {
      handleState(webViewController, res);
      // handleState(webViewController, message);
    }
  }
}
