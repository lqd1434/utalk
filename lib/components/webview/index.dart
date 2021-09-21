import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/webview/webview_body.dart';
import 'package:myapp/components/webview/webview_header.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/utils/event_bus_event.dart';
import 'package:myapp/utils/event_manage.dart';
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
  double appBarHeight = 45;
  final GetxState getX = Get.find();
  final Completer<WebViewController> webViewController = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    EventManager.getInstance().eventBus!.on<DoubleEvent>().listen((event) {
      setState(() {
        appBarHeight = event.content;
      });
    });
  }

  void fullscreen() {
    setState(() {
      appBarHeight = 0;
    });
    SystemChrome.setEnabledSystemUIOverlays([]);
    Get.back();
  }

  Future<bool> _willPopScope() async {
    if (appBarHeight == 0) {
      setState(() {
        appBarHeight = 45;
      });
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopScope,
      child: Scaffold(
          extendBody: false,
          extendBodyBehindAppBar: false,
          appBar: webViewHeader(
            context: context,
            title: widget.title,
            fullscreenFunc: fullscreen,
            appBarHeight: appBarHeight,
          ),
          body: WebviewBody(url: widget.url)),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
    super.dispose();
  }
}
