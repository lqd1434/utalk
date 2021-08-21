import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;
  final bool isLocalUrl;

  WebViewPage({
    Key? key,
    required this.url,
    this.isLocalUrl = false,
    required this.title,
  }) : super(key: key);

  @override
  _WebViewPage createState() => _WebViewPage();
}

class _WebViewPage extends State<WebViewPage> {
  // WebViewController? webViewController;
  final Completer<WebViewController> webViewController = Completer<WebViewController>();

  JavascriptChannel jsBridge(BuildContext context) => JavascriptChannel(
      name: 'jsbridge', // 与h5 端的一致 不然收不到消息
      onMessageReceived: (JavascriptMessage message) async {
        debugPrint(message.message);
      });

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppbar(), body: _buildBody());
  }

  _buildAppbar() {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
            onPressed: () {
              Get.offAndToNamed('/home');
            }));
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 1,
          width: double.infinity,
          child: DecoratedBox(decoration: BoxDecoration(color: Color(0xFFEEEEEE))),
        ),
        Expanded(
          flex: 1,
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
              controller.canGoBack().then((value) => debugPrint(value.toString()));
              controller.canGoForward().then((value) => debugPrint(value.toString()));
              controller.currentUrl().then((value) => debugPrint(value));
            },
            onPageFinished: (String value) {
              webViewController.future.then((value) =>
                  {value..evaluateJavascript('document.title').then((title) => debugPrint(title))});
            },
          ),
        )
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
