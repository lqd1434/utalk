import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/src/response.dart' as Res;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import 'back_btn.dart';

class Working extends StatefulWidget {
  const Working({Key? key}) : super(key: key);

  @override
  _WorkingState createState() => _WorkingState();
}

class _WorkingState extends State<Working> {
  Artboard? _riveArtBoard;
  RiveAnimationController? _controller;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    final bytes = await compute(loadRive, 1);
    RiveFile file = RiveFile.import(bytes);
    Artboard artboard = file.mainArtboard;
    artboard.addController(_controller = SimpleAnimation('Animation 1'));
    if (mounted) {
      setState(() {
        _riveArtBoard = artboard;
      });
    }
  }

  //  线程隔离（Isolate）使用
  static Future<ByteData> loadRive(int x) async {
    String url = 'http://47.103.211.10:9090/static/rive/house.riv';
    Dio dio = Dio();
    dio.options.responseType = ResponseType.bytes;
    Res.Response response = await dio.get(url);
    final Uint8List uint8List = response.data;
    final bytes = ByteData.view(uint8List.buffer);
    dio.close();
    return bytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(Get.arguments.toString(), style: const TextStyle(fontSize: 20)),
          leading: const BackBtn(
            path: '/home',
          )),
      body: SizedBox.expand(
        child: Stack(children: [
          _riveArtBoard == null
              ? const SizedBox()
              : Center(
                  child: Rive(
                    artboard: _riveArtBoard!,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
          Positioned(
            bottom: 100,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: SizedBox()),
                  Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: const Text(
                      '施工🚧🚧中...',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
