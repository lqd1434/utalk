import 'package:flutter/material.dart';
import 'package:myapp/components/u_webview.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({Key? key}) : super(key: key);

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  @override
  Widget build(BuildContext context) {
    return const WebViewPage(
      title: Text('webview测试'),
      url: 'http://47.103.211.10',
      isLocalUrl: false,
    );
  }
}
