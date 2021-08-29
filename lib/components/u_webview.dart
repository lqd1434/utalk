import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/utils/event_bus_event.dart';
import 'package:myapp/utils/event_manage.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/webView/webview_utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rive/rive.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final Widget? title;
  final Widget? leading;
  final IconData? leftIcon;
  final bool isLocalUrl;

  const WebViewPage({
    Key? key,
    required this.url,
    this.isLocalUrl = false,
    this.title,
    this.leading,
    this.leftIcon,
  }) : super(key: key);

  @override
  _WebViewPage createState() => _WebViewPage();
}

class _WebViewPage extends State<WebViewPage> {
  Logger logger = Logger();
  double percent = 0;
  double appBarHeight = 45;
  final GetxState getX = Get.find();
  final Completer<WebViewController> webViewController = Completer<WebViewController>();
  late VoidCallback func;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    EventManager.getInstance().eventBus!.on<DoubleEvent>().listen((event) {
      setState(() {
        appBarHeight = event.content;
      });
    });
    func = call;
  }

  void call() {
    logger.i('11');
  }

  JavascriptChannel jsBridge(BuildContext context) => JavascriptChannel(
      name: 'JsBridge', // 与h5 端的一致 不然收不到消息
      onMessageReceived: (JavascriptMessage message) async {
        WebviewUtils.handleMessage(webViewController, json.decoder.convert(message.message));
        logger.w(json.decoder.convert(message.message));
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, appBarHeight),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: widget.title,
            leading: widget.leading,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 31,
                      child: TextButton(
                        // onPressed: func,
                        onPressed: () {
                          // logger.w(EventsHandle.getEventByName('ping'));
                          // webViewController.future.then((value) {
                          //   //注意用不同的括号...
                          //   value
                          //       .evaluateJavascript("window.call.method('8')")
                          //       .then((value) => {logger.e(json.decoder.convert(value))});
                          // });
                        },
                        style: _btnStyleLeft(),
                        child: Container(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45, width: 0.3),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                )),
                            child: Icon(
                              widget.leftIcon ?? Icons.more_horiz,
                              size: 28,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 31,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(Get.previousRoute);
                        },
                        style: _btnStyleRight(),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45, width: 0.3),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                )),
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: const Icon(
                              Icons.power_settings_new,
                              size: 28,
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: _buildBody(context));
  }

  _buildBody(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          children: [
            const SizedBox(
              height: 1,
              width: double.infinity,
              child: DecoratedBox(decoration: BoxDecoration(color: Color(0xFFEEEEEE))),
            ),
            Flexible(
              flex: 1,
              child: Visibility(
                visible: percent == 100,
                maintainState: true,
                child: WebView(
                  initialUrl: widget.isLocalUrl
                      ? Uri.dataFromString(widget.url,
                              mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
                          .toString()
                      : widget.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  javascriptChannels: <JavascriptChannel>{jsBridge(context)},
                  onWebViewCreated: (WebViewController controller) {
                    webViewController.complete(controller);
                    controller.clearCache();
                    setState(() {});
                    if (widget.isLocalUrl) {
                      _loadHtmlAssets(controller);
                    } else {
                      controller.loadUrl(widget.url);
                    }
                    // controller.canGoBack().then((value) => logger.w(value.toString()));
                    // controller.canGoForward().then((value) => logger.w(value.toString()));
                    // controller.currentUrl().then((value) => logger.w(value));
                  },
                  onProgress: (int p) {
                    setState(() {
                      percent = p.toDouble();
                    });
                  },
                  onPageFinished: (String value) {
                    logger.i('onPageFinished');
                    getX.setWebView(webViewController);
                    webViewController.future.then((value) => {
                          value
                              .evaluateJavascript('document.title')
                              .then((title) => logger.w(title))
                        });
                  },
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 150,
          child: Visibility(
            visible: percent != 100,
            maintainSize: false,
            child: Container(
              width: 300,
              height: 300,
              margin: const EdgeInsets.only(bottom: 30),
              child: const RiveAnimation.asset(
                'static/flare/runner_boy.riv',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            left: (MediaQuery.of(context).size.width - 150) / 2,
            top: 400,
            child: Visibility(
              visible: percent != 100,
              maintainSize: false,
              child: Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: LinearPercentIndicator(
                    width: 150.0,
                    lineHeight: 6.0,
                    percent: percent / 100,
                    backgroundColor: HexColor('#FDAA9B'),
                    progressColor: HexColor('#FB2B04'),
                  )),
            ))
      ],
    );
  }

//加载本地文件
  _loadHtmlAssets(WebViewController controller) async {
    String htmlPath = await rootBundle.loadString(widget.url);
    controller.loadUrl(
        Uri.dataFromString(htmlPath, mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
            .toString());
  }
}

_btnStyleLeft() {
  return ButtonStyle(
      enableFeedback: true,
      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
      elevation: MaterialStateProperty.all(0),
      overlayColor: MaterialStateProperty.all(HexColor('#CCCCCC')),
      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)))),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.resolveWith((state) {
        return Colors.black54;
      }));
}

_btnStyleRight() {
  return ButtonStyle(
      enableFeedback: true,
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      elevation: MaterialStateProperty.all(0),
      overlayColor: MaterialStateProperty.all(HexColor('#CCCCCC')),
      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(bottomRight: Radius.circular(30), topRight: Radius.circular(30)))),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.resolveWith((state) {
        return Colors.black54;
      }));
}

class Test {
  Test() {
    print('11');
  }
}
