import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/back_btn.dart';
import 'package:myapp/components/rive_loading.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:rive/rive.dart';

class HappYEveryDay extends StatefulWidget {
  const HappYEveryDay({Key? key}) : super(key: key);

  @override
  _HappYEveryDayState createState() => _HappYEveryDayState();
}

class _HappYEveryDayState extends State<HappYEveryDay> {
  Artboard? _riveArtBoard;
  RiveAnimationController? _controller;

  bool _handsUp = false;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    final bytes = await compute(loadRive, 1);
    RiveFile file = RiveFile.import(bytes);
    Artboard artboard = file.mainArtboard;
    artboard.addController(_controller = SimpleAnimation('fail'));
    setState(() {
      _riveArtBoard = artboard;
    });
  }

  //  线程隔离（Isolate）使用
  static Future<ByteData> loadRive(int x) async {
    String url = 'http://47.103.211.10:9090/static/rive/teddy_login_screen.riv';
    Dio dio = Dio();
    dio.options.responseType = ResponseType.bytes;
    Response response = await dio.get(url);
    final Uint8List uint8List = response.data;
    final bytes = ByteData.view(uint8List.buffer);
    dio.close();
    return bytes;
  }

  void _changeBeerState(String state) {
    if (state == 'hands_up') {
      setState(() {
        _handsUp = true;
        _riveArtBoard?.addController(_controller = SimpleAnimation(state));
      });
      Future.delayed(const Duration(seconds: 3), () {
        if (_handsUp) {
          setState(() {
            _handsUp = false;
            _riveArtBoard?.addController(_controller = SimpleAnimation('hands_down'));
          });
        }
      });
    } else {
      if (_handsUp) {
        setState(() {
          _handsUp = false;
          _riveArtBoard?.addController(_controller = SimpleAnimation('hands_down'));
          _riveArtBoard?.addController(_controller = SimpleAnimation(state));
        });
      } else {
        setState(() {
          _riveArtBoard?.addController(_controller = SimpleAnimation(state));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#B6ADDC'),
        extendBody: true,
        body: _riveArtBoard != null
            ? HappyView(
                riveArtBoard: _riveArtBoard!,
                changeFunc: _changeBeerState,
              )
            : const RiveLoading());
  }
}

typedef ChangeCallback = void Function(String state);

class HappyView extends StatefulWidget {
  final Artboard riveArtBoard;
  final ChangeCallback changeFunc;

  const HappyView({Key? key, required this.riveArtBoard, required this.changeFunc})
      : super(key: key);

  @override
  _HappyViewState createState() => _HappyViewState();
}

class _HappyViewState extends State<HappyView> {
  @override
  Widget build(BuildContext context) {
    print('11');
    return Column(
      children: [
        Container(
            height: 30,
            margin: const EdgeInsets.only(left: 10, top: 30, bottom: 10),
            padding: EdgeInsets.zero,
            alignment: Alignment.topLeft,
            child: const BackBtn(
              path: '/home',
            )),
        Container(
          height: 260,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          decoration: BoxDecoration(
              color: HexColor('#F8F8F8'),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 5)]),
          child: Rive(
            artboard: widget.riveArtBoard,
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        ),
        Container(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '此刻心情:',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        widget.changeFunc('fail');
                      },
                      style: getButtonStyle(),
                      child: const Text(
                        '继续哭',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        widget.changeFunc('success');
                      },
                      style: getButtonStyle(),
                      child: const Text(
                        '笑一个',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        widget.changeFunc('hands_up');
                      },
                      style: getButtonStyle(),
                      child: const Text(
                        '下一个',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 280,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)],
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              SingleChildScrollView(
                child: AutoSizeText(
                  '    为了避免用户误触返回按钮而导致APP退出，'
                  '在很多APP中都拦截了用户点击返回键的按钮，然后进行一些防误触判断，'
                  '比如当用户在某一个时间段内点击两次时，才会认为用户是要退出（而非误触）。'
                  'Flutter中可以通过WillPopScope来实现返回按钮拦截',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  '-- 每日一笑',
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

ButtonStyle getButtonStyle() {
  return ButtonStyle(
      enableFeedback: true,
      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10, vertical: 8)),
      elevation: MaterialStateProperty.all(5),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      backgroundColor: MaterialStateProperty.all(Colors.deepPurple));
}
