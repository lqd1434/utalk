import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:myapp/modules/chat.dart';
import 'package:myapp/pages/webviewPage/webview_toast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rive/rive.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  Logger logger = Logger();
  late SMIInput<bool> _hoverInput;
  late SMIInput<bool> _pressedInput;
  late SMIInput<double> _numberInput;
  Artboard? _artboard;

  @override
  void initState() {
    rootBundle.load('static/flare/energy_bar.riv').then((bytes) {
      final file = RiveFile.import(bytes);
      final artboard = file.mainArtboard;
      var controller = StateMachineController.fromArtboard(artboard, 'State Machine ');
      if (controller != null) {
        artboard.addController(controller);
        // _hoverInput = controller.findInput('Hover')!;
        // _pressedInput = controller.findInput('Pressed')!;
        _numberInput = controller.findInput('Energy')!;
        setState(() {
          _artboard = artboard;
        });
      }
    });

    SystemChrome.setEnabledSystemUIOverlays([]);
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 5))
      ..addStatusListener((status) {
        print(animation.value);
      });
    animation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.easeInCirc))
        .animate(animationController);
    super.initState();
  }

  List<ChatHistory> list = [];

  handleClick() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    logger.w(packageInfo.appName);
    logger.w(packageInfo.packageName);
    logger.w(packageInfo.version);
    logger.w(packageInfo.buildNumber);
    logger.w(packageInfo.buildSignature);
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    logger.i(androidInfo);
    // logger.i(androidInfo.toMap());
    logger.i(Platform.operatingSystem);

    WebViewToast.showLoading(context);
    _hoverInput.value = true;
    _pressedInput.value = true;
    WebViewToast.showInfo(context, 'success', '今天真的很开心的很的很');
    // _numberInput.value = _numberInput.value + 10;
    //
    // final DioResponse.Response<List> res = await DioManege.getInstance().dio!.get(
    //     'http://47.103.211.10:8080/msg/limit',
    //     queryParameters: {'count': 2, 'lastId': list.length, 'from': 1, 'to': 2});
    //
    // for (var element in res.data!) {
    //   list.add(ChatHistory.fromJson(element));
    // }
    // logger.i(list.length);
    // for (var element in list) {
    //   logger.w(element.id);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1200,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 800,
          color: Colors.white,
          child: TextButton(
            onPressed: handleClick,
            child: _artboard == null
                ? const SizedBox()
                : Rive(
                    artboard: _artboard!,
                    fit: BoxFit.contain,
                  ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

// @override
// Widget build(BuildContext context) {
//   return Container(
//     color: Colors.transparent,
//     child: Material(
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 90,
//           ),
//           IconButton(
//               onPressed: () {
//                 animationController.forward();
//                 if (animationController.isCompleted) {
//                   animationController.reverse();
//                 }
//               },
//               icon: const Icon(Icons.add)),
//           const SizedBox(
//             height: 30,
//           ),
//           RotationTransition(
//             alignment: Alignment.center,
//             //动画控制器
//             turns: animationController,
//             //将要执行动画的子view
//             child: GestureDetector(
//               onVerticalDragDown: (details) {
//                 logger.i(details.localPosition);
//                 animationController.forward();
//               },
//               child: Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.grey,
//               ),
//             ),
//           ),
//           // AnimatedBuilder(
//           //   animation: animation,
//           //   child: const FlutterLogo(size: 80),
//           //   builder: (BuildContext context, Widget? child) {
//           //     return RotationTransition(
//           //       turns: animation,
//           //       child: ScaleTransition(
//           //         scale: animation,
//           //         child: FadeTransition(
//           //           opacity: animation,
//           //           child: child,
//           //           // child: Transform(
//           //           //   transform: Matrix4.translationValues(0, animation.value * 60, 0),
//           //           //   child: child,
//           //           // ),
//           //         ),
//           //       ),
//           //     );
//           //   },
//           // ),
//         ],
//       ),
//     ),
//   );
// }
}
