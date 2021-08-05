import 'dart:io';
import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:get/get.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:path_provider/path_provider.dart';

//验证文件是否存在
Future<File> readMyIcon() async {
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  File file = File('$tempPath/myIcon.png');
  return file;
}

//同步读取文件
Uint8List loadIcon() {
  GetxState getX = Get.find();
  File file = File(getX.icon.value);
  return file.readAsBytesSync();
}
