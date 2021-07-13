// ignore_for_file: file_names, prefer_final_fields, must_be_immutable

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/LoginInput.dart';
import 'package:myapp/components/bottomThirdIcons.dart';
import 'package:myapp/utils/save_login_data.dart';

import '../../response/response.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginStatePage();
}

class _LoginStatePage extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  Logger logger = Logger();

  Color? _color1;
  Color? _color2;

  void _handlePress() async {
      try {
        var response = await Dio().post(
            'http://47.103.211.10:8080/login',
          data: {
            'email':_emailController.value.text,
            'password':_passwordController.value.text
          },
        );
        NestRes res = NestRes.fromJson(response.data);
        if(res.statusCode == 200){
          saveLoginData(res.dataBody);
          BotToast.showSimpleNotification(
            title: res.description,
            backgroundColor: const Color.fromRGBO(179, 255, 102, 1),
            titleStyle:const TextStyle(color:  Color.fromRGBO(76, 153, 0, 1)),
          );
          Get.offAllNamed('/home');
        } else{
          BotToast.showText(
              text:res.description,
              contentColor: const Color.fromRGBO(245, 62, 62, 1),
              textStyle: const TextStyle(color: Colors.white)
          );
        }
      } catch (e) {
        logger.e(e);
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
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('static/images/bg_login.jpg'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20,70,0,0),
                  child: GestureDetector(
                    onTap: (){Get.offAllNamed('/');},
                    child: Row(
                      children:const [
                        Icon(Icons.arrow_back_ios_new,color: Color.fromRGBO(210, 254, 255, 1),),
                        Text('返回',style: TextStyle(color:Color.fromRGBO(210, 254, 255, 1),fontSize: 17),)
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
                          child: MyInput(
                              hintText: '邮箱',
                              color: _color1,
                              textEditingController: _emailController,
                              focusNode: focusNode1,
                              prefixIcon: const Icon(Icons.person,
                                  color: Color.fromRGBO(210, 254, 255, 1)),
                              obscureText: false),
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                            child: MyInput(
                                hintText: '密码',
                                color: _color2,
                                textEditingController: _passwordController,
                                focusNode: focusNode2,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Color.fromRGBO(210, 254, 255, 1),
                                ),
                                obscureText: true)),
                        DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color.fromRGBO(161, 255, 242, 1),
                                  Color.fromRGBO(212, 255, 255, 1),
                                ]), //背景渐变
                                borderRadius:
                                    BorderRadius.circular(10.0), //3像素圆角
                                boxShadow: const [
                                  //阴影
                                  BoxShadow(
                                      color: Color.fromRGBO(212, 255, 255, 1),
                                      blurRadius: 10.0)
                                ]),
                            child: TextButton(
                              onPressed: _handlePress,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 115.0, vertical: 4.0),
                                child: Text(
                                  "登录",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                ),
                              ),
                            )),
                        Row(
                          children: [
                            const Expanded(child: SizedBox()),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                '忘记密码?',
                                style: TextStyle(
                                    color: Color.fromRGBO(210, 254, 255, 1),
                                    fontSize: 16),
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 600),
                  child: Row(
                      children: const [
                        Expanded(child: SizedBox()),
                        Center(
                          child: BottomThirdIcons(
                            iconColor: Color.fromRGBO(159, 252, 242, 1),
                            lineColor: Color.fromRGBO(210, 254, 255, 1),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                      ]),
                )
              ],
          )));
  }
}
