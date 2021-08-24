// ignore_for_file: file_names,

import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/input_field.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/request/my_dio.dart';
import 'package:myapp/response/response.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/save_login_data.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AuthPageStatePage();
}

class AuthPageStatePage extends State<AuthPage> {
  bool _visibility = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  ButtonState? state = ButtonState.idle;
  bool onLoading = false;
  final GetxState getX = Get.find();

  void _handlePress() async {
    if (_emailController.value.text.isNotEmpty && _passwordController.value.text.isNotEmpty) {
      if (_emailController.value.text.isEmail) {
        setState(() {
          state = ButtonState.loading;
        });
        try {
          var response = await DioManege.getInstance().dio!.post(
            'http://47.103.211.10:8080/login',
            data: {
              'email': _emailController.value.text,
              'password': _passwordController.value.text
            },
          );
          NestRes res = NestRes.fromJson(response.data);
          if (res.statusCode == 200) {
            Logger().i(response.data);
            getX.setUserInfo(res.dataBody!.user!);
            saveLoginData(res.dataBody).then((value) => {
                  setState(() {
                    state = ButtonState.success;
                  }),
                  Timer(const Duration(seconds: 2), () {
                    Get.offAllNamed('/');
                  })
                });
          } else {
            setState(() {
              state = ButtonState.idle;
            });
            BotToast.showText(
                text: res.description,
                contentColor: const Color.fromRGBO(245, 62, 62, 1),
                textStyle: const TextStyle(color: Colors.white));
          }
        } catch (e) {
          setState(() {
            state = ButtonState.idle;
          });
          BotToast.showText(
              text: '密码错误',
              contentColor: const Color.fromRGBO(245, 62, 62, 1),
              textStyle: const TextStyle(color: Colors.white));
        }
      } else {
        setState(() {
          state = ButtonState.idle;
        });
        BotToast.showText(
            text: '邮箱格式错误',
            contentColor: const Color.fromRGBO(245, 62, 62, 1),
            textStyle: const TextStyle(color: Colors.white));
      }
    } else {
      setState(() {
        state = ButtonState.idle;
      });
      BotToast.showText(
          text: '账号和密码不能为空',
          contentColor: const Color.fromRGBO(245, 62, 62, 1),
          textStyle: const TextStyle(color: Colors.white));
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
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        HexColor('#7F7FDA'),
                        HexColor('#8787D2'),
                        HexColor('#7E83CB'),
                        HexColor('#A1A1EB'),
                      ])),
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
                  top: 340,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    height: 360,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        InputField(
                          controller: _emailController,
                          prefixIcon: Icons.account_circle,
                          hintText: "请输入邮箱",
                        ),
                        InputField(
                          controller: _passwordController,
                          obscureText: !_visibility,
                          prefixIcon: Icons.lock,
                          hintText: "请输入密码",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _visibility = !_visibility;
                                });
                              },
                              icon: _visibility
                                  ? Icon(
                                      Icons.visibility,
                                      color: HexColor('#8787D2'),
                                      size: 30,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: HexColor('#8787D2'),
                                      size: 27,
                                    )),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: Text('忘记密码?',
                              style: TextStyle(fontSize: 18, color: HexColor('#7F7FDA'))),
                        ),
                        Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                            child: ProgressButton.icon(
                                maxWidth: MediaQuery.of(context).size.width - 40,
                                // padding: const EdgeInsets.symmetric(vertical: 10),
                                textStyle: const TextStyle(fontSize: 27, color: Colors.white),
                                iconedButtons: {
                                  ButtonState.idle: IconedButton(
                                      icon: const Icon(Icons.login, color: Colors.white, size: 30),
                                      text: '登录',
                                      color: HexColor('#7F7FDA')),
                                  ButtonState.loading:
                                      IconedButton(color: Colors.deepPurple.shade700),
                                  ButtonState.fail: IconedButton(
                                      text: "登录失败",
                                      icon: const Icon(Icons.cancel, color: Colors.white),
                                      color: Colors.red.shade300),
                                  ButtonState.success: IconedButton(
                                      text: "登录成功",
                                      icon: const Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                      ),
                                      color: HexColor('#3CB552'))
                                },
                                onPressed: state == ButtonState.loading ? null : _handlePress,
                                state: state)),
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 18),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed('/register');
                              },
                              child: Text('没有账号? 去注册',
                                  style: TextStyle(fontSize: 18, color: HexColor('#7F7FDA'))),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
