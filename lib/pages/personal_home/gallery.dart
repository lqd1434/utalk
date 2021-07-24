import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/src/response.dart' as Res;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/loading.dart';
import 'package:myapp/utils/constant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'gallery_view.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<Gallery> {
  Logger logger = Logger();
  List<Uint8List> allImageList = <Uint8List>[];

  @override
  Widget build(BuildContext context) {
    if (allImageList.isEmpty) {
      _getImages();
      return const Loading();
    } else {
      return GalleryView(images: allImageList);
    }
  }

  void getPer() async {
    if (await Permission.storage.isGranted) {
      PermissionStatus sts = await Permission.storage.request();
    }
  }

  @override
  void initState() {
    super.initState();
    getPer();
  }

  Future<void> _getImages() async {
    bool state = true;
    List<Uint8List> imageList = <Uint8List>[];
    //判断是否有缓存
    for (int i = 0; i < galleryImages.length; i++) {
      File file = File('/data/user/0/com.lqd.myapp/cache/$i.jpg');
      if (!file.existsSync()) {
        state = false;
      }
    }
    //有缓存
    if (state) {
      for (int i = 0; i < galleryImages.length; i++) {
        File file = File('/data/user/0/com.lqd.myapp/cache/$i.jpg');
        Uint8List bytes = await file.readAsBytes();
        imageList.add(bytes);
      }
    } else {
      //没有缓存
      for (int i = 0; i < galleryImages.length; i++) {
        Uint8List bytes = await _getOneImage(galleryImages[i], i);
        imageList.add(bytes);
      }
    }
    logger.i(state);
    if (state) {
      Future.delayed(const Duration(seconds: 3), () async {
        setState(() {
          allImageList = imageList;
        });
      });
    } else {
      setState(() {
        allImageList = imageList;
      });
    }
  }

  Future<Uint8List> _getOneImage(String url, int i) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // String appDocPath = appDocDir.path;

    Dio dio = Dio();
    dio.options.responseType = ResponseType.bytes;
    Res.Response response = await dio.get(url);
    final Uint8List bytes = response.data;
    File file = File('$tempPath/$i.jpg');
    //图片暂存到临时目录(系统可随时清除)
    File file1 = await file.writeAsBytes(bytes);
    return bytes;
  }
}
