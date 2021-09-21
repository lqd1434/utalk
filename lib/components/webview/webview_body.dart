import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/webview_handle/webview_utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rive/rive.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewBody extends StatefulWidget {
  final String url;

  const WebviewBody({Key? key, required this.url}) : super(key: key);

  @override
  _WebviewBodyState createState() => _WebviewBodyState();
}

class _WebviewBodyState extends State<WebviewBody> {
  double percent = 0;
  Logger logger = Logger();
  final GetxState getX = Get.find();
  final Completer<WebViewController> webViewController = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  JavascriptChannel jsBridge(BuildContext context) => JavascriptChannel(
      name: 'JsBridge', // 与h5 端的一致 不然收不到消息
      onMessageReceived: (JavascriptMessage message) {
        logger.w(json.decoder.convert(message.message), '0000');

        WebviewUtils.handleMessage(
            context, webViewController, json.decoder.convert(message.message));
      });

  @override
  Widget build(BuildContext context) {
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
                  debuggingEnabled: true,
                  initialUrl: widget.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  javascriptChannels: <JavascriptChannel>{jsBridge(context)},
                  onWebViewCreated: (WebViewController controller) {
                    controller.clearCache();
                    webViewController.complete(controller);
                    getX.setWebView(webViewController);
                    controller.loadUrl(widget.url);
                    // if (widget.isLocalUrl) {
                    //   _loadHtmlAssets(controller);
                    // } else {
                    //   controller.loadUrl(widget.url);
                    // }
                  },
                  onProgress: (int p) {
                    setState(() {
                      percent = p.toDouble();
                    });
                  },
                  onPageFinished: (String value) {
                    webViewController.future.then((value) => {
                          value
                              .evaluateJavascript('document.title')
                              .then((title) => {logger.i(title)})
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
}

// //加载本地文件
// _loadHtmlAssets(WebViewController controller,url) async {
//   // widget.isLocalUrl
//   //     ? Uri.dataFromString(widget.url,
//   //     mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
//   //     .toString()
//   //     :
//   String htmlPath = await rootBundle.loadString(url);
//   controller.loadUrl(
//       Uri.dataFromString(htmlPath, mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
//           .toString());
// }
