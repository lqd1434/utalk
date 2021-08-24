import 'package:flutter/material.dart';
import 'package:myapp/components/u_webview.dart';

class MyWebVie extends StatefulWidget {
  const MyWebVie({Key? key}) : super(key: key);

  @override
  _MyWebVieState createState() => _MyWebVieState();
}

class _MyWebVieState extends State<MyWebVie> {
  @override
  Widget build(BuildContext context) {
    return WebViewPage(
      title: Text('百度一下'),
      url: 'http://47.103.211.10:9090/static/hello.html',
      isLocalUrl: false,
    );
  }
}
