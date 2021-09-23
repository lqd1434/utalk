import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myapp/getx/getx_state.dart';

double viewPort(String size) {
  final GetxState gexState = Get.find();
  final ctx = gexState.ctx.value;
  final len = size.length;
  final height = MediaQuery.of(ctx).size.height;
  final width = MediaQuery.of(ctx).size.width;

  final _sizeStr = size.substring(0, len - 2);
  final _size = int.parse(_sizeStr);

  if (size.endsWith('vw')) {
    return width / 100 * _size;
  } else if (size.endsWith('vh')) {
    return height / 100 * _size;
  } else {
    return 0;
  }
}
