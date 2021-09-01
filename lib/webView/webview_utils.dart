import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
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

  static handleEvent(
      BuildContext context, Completer<WebViewController> webViewController, Map message) {
    if (message['name'] == "fullScreen") {
      EventsHandle.getEventByName('fullScreen')(context, json.decode(message['data']));
    } else {
      var resFromJs = ResFromJs.fromJson(message);
      EventsHandle.getEventByName(resFromJs.name!)(context, resFromJs.data);
    }
  }

  static handleState(Completer<WebViewController> webViewController, ResFromJs resFromJs) {
    StatesHandle.getStateByName(resFromJs.name!);
  }

  static handleMessage(
      BuildContext context, Completer<WebViewController> webViewController, Map message) {
    if (message['type'] == 'event') {
      handleEvent(context, webViewController, message);
    } else if (message['type'] == 'state') {
      var res = ResFromJs.fromJson(message);
      handleState(webViewController, res);
      // handleState(webViewController, message);
    }
  }
}
