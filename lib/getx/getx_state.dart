// ignore_for_file: file_names

import 'dart:typed_data';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GetxState extends GetxController {
  var count = 1.obs;
  var currentIndex = 0.obs;
  var isShowCarousel = false.obs;
  var socket = Rx<dynamic>(null);
  var isShowAppbar = true.obs;

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
}
