// ignore_for_file: file_names,

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/block_btn.dart';
import 'package:myapp/components/block_input.dart';
import 'package:myapp/components/bottomThirdIcons.dart';
import 'package:myapp/response/response.dart';
import 'package:myapp/utils/save_login_data.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AuthPageStatePage();
}

class AuthPageStatePage extends State<AuthPage> {
  bool _visibility = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handlePress() async {
    try {
      var response = await Dio().post(
        'http://47.103.211.10:8080/login',
        data: {'email': _emailController.value.text, 'password': _passwordController.value.text},
      );
      NestRes res = NestRes.fromJson(response.data);
      if (res.statusCode == 200) {
        saveLoginData(res.dataBody);
        BotToast.showSimpleNotification(
          title: res.description,
          backgroundColor: const Color.fromRGBO(179, 255, 102, 1),
          titleStyle: const TextStyle(color: Color.fromRGBO(76, 153, 0, 1)),
        );
        Get.offAllNamed('/home');
      } else {
        BotToast.showText(
            text: res.description,
            contentColor: const Color.fromRGBO(245, 62, 62, 1),
            textStyle: const TextStyle(color: Colors.white));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Stack(
              children: [
                Container(
                  color: const Color.fromRGBO(101, 60, 179, 1),
                  width: double.maxFinite,
                  height: double.maxFinite,
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(
                        (MediaQuery.of(context).size.width - 120) / 2, 90, 0, 0),
                    child: Column(
                      children: [
                        Image.network(
                          'http://47.103.211.10:9090/static/images/pika.png',
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                          child: const Text('utalk',
                              style: TextStyle(fontSize: 40, color: Colors.amber)),
                        ),
                      ],
                    )),
                Positioned(
                  bottom: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    height: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(235, 231, 252, 1),
                              borderRadius: BorderRadius.circular(50)),
                          child: TextField(
                            controller: _emailController,
                            cursorColor: Colors.black45,
                            style: const TextStyle(fontSize: 18, letterSpacing: 1),
                            decoration: const InputDecoration(
                                hintText: "请输入邮箱",
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  size: 30,
                                  color: Colors.black45,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(235, 231, 252, 1),
                              borderRadius: BorderRadius.circular(50)),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: !_visibility,
                            style: const TextStyle(fontSize: 18, letterSpacing: 1),
                            decoration: InputDecoration(
                                hintText: "请输入密码",
                                focusColor: Colors.black,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  size: 30,
                                  color: Colors.black45,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _visibility = !_visibility;
                                      });
                                    },
                                    icon: _visibility
                                        ? const Icon(
                                            Icons.visibility,
                                            color: Colors.black45,
                                            size: 30,
                                          )
                                        : const Icon(
                                            Icons.visibility_off,
                                            color: Colors.black45,
                                            size: 27,
                                          )),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: const Text('忘记密码?', style: TextStyle(fontSize: 18)),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: BlockButton(
                              handlePress: _handlePress,
                              borderRadius: 30,
                              text: const Text('登录',
                                  style: TextStyle(fontSize: 27, color: Colors.white)),
                              gradient: const LinearGradient(colors: [
                                Color.fromRGBO(99, 48, 191, 1),
                                Color.fromRGBO(99, 48, 191, 1)
                              ]),
                            )),
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 18),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed('/register');
                              },
                              child: const Text('没有账号? 去注册', style: TextStyle(fontSize: 18)),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
