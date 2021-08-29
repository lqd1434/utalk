// ignore_for_file: file_names

import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:myapp/response/User.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GetxState extends GetxController {
  var count = 1.obs;
  var currentIndex = 0.obs;
  var isShowCarousel = false.obs;
  var socket = Rx<dynamic>(null);
  var isShowAppbar = true.obs;
  var userInfo = User().obs;
  var icon = ''.obs;
  var webViewCtr = Rx<dynamic>(null);

  increment() => count++;

  changeIndex(index) {
    currentIndex.value = index;
  }

  changeIsShowCarousel(status) {
    isShowCarousel.value = status;
  }

  setSocket(dynamic socketInstance) {
    socket.value = socketInstance;
  }

  clearSocket() {
    socket.value = null;
  }

  changeIsShowAppBar(bool status) {
    isShowAppbar.value = status;
  }

  setIcon(String path) {
    icon.value = path;
  }

  clearIcon() {
    icon.value = '';
  }

  setUserInfo(User user) {
    userInfo.value = user;
  }

  clearUserInfo() {
    userInfo.value = userInfo();
  }

  setWebView(Completer<WebViewController> controller) {
    webViewCtr.value = controller;
  }

  clearWebView() {
    webViewCtr.value = null;
  }
}
