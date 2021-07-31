import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class RegisterInput extends StatelessWidget {
  final String labelText;
  final Icon? prefixIcon;
  final bool obscureText;
  final TextEditingController controller;

  const RegisterInput({
    Key? key,
    required this.labelText,
    required this.obscureText,
    required this.controller,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.deepPurple,
      obscureText: obscureText,
      controller: controller,
      style: const TextStyle(color: Colors.deepPurple),
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon,
          focusColor: Colors.deepPurple,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.deepPurple,
            ),
          ),
          hoverColor: Colors.deepPurple,
          labelStyle: const TextStyle(color: Colors.deepPurple),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.deepPurple,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.deepPurple,
            ),
          )),
    );
  }
}

class EmailVerify extends StatefulWidget {
  final TextEditingController emailEditingController;
  final TextEditingController verifyCodeEditingController;
  final VoidCallback handleVerify;
  final VoidCallback sendVerifyCode;

  const EmailVerify(
      {Key? key,
      required this.emailEditingController,
      required this.verifyCodeEditingController,
      required this.handleVerify,
      required this.sendVerifyCode})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => EmailVerifyStatePage();
}

class EmailVerifyStatePage extends State<EmailVerify> {
  int _timeCount = 60;
  Timer? countDownTimer;

  _sendVerifyCode() {
    if (widget.emailEditingController.value.text.isNotEmpty) {
      widget.sendVerifyCode();
      const timeout = Duration(seconds: 1);
      Timer.periodic(timeout, (timer) {
        //callback function
        //1s 回调一次
        countDownTimer = timer;
        setState(() {
          _timeCount--;
        });
        if (_timeCount == 0) {
          countDownTimer!.cancel();
          setState(() {
            _timeCount = 60;
          });
        }
      });
    } else {
      BotToast.showText(
          text: '邮箱不能为空',
          contentColor: const Color.fromRGBO(245, 62, 62, 1),
          textStyle: const TextStyle(color: Colors.white));
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (countDownTimer != null) {
      countDownTimer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              '注册',
              style: TextStyle(color: Colors.deepPurple, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: RegisterInput(
              controller: widget.emailEditingController,
              labelText: '邮箱',
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.deepPurple,
              ),
              obscureText: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: RegisterInput(
                    controller: widget.verifyCodeEditingController,
                    labelText: '验证码',
                    prefixIcon: const Icon(
                      Icons.security,
                      color: Colors.deepPurple,
                    ),
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10.0), //3像素圆角
                          boxShadow: const [
                            //阴影
                            BoxShadow(
                                color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4.0)
                          ]),
                      child: SizedBox(
                        width: 95,
                        height: 56,
                        child: TextButton(
                          onPressed: _timeCount == 60 ? _sendVerifyCode : null,
                          child: Text(
                            _timeCount == 60 ? '获取验证码' : _timeCount.toString() + 's',
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10.0), //3像素圆角
                    boxShadow: const [
                      //阴影
                      BoxShadow(color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4.0)
                    ]),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 56,
                  child: TextButton(
                    onPressed: widget.handleVerify,
                    child: const Text(
                      "验证",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

typedef VoidCallback = Function();

class PasswordAndName extends StatefulWidget {
  final TextEditingController nameEditingController;
  final TextEditingController passwordEditingController;
  final TextEditingController ensurePasswordEditingController;
  final VoidCallback handleRegister;

  const PasswordAndName({
    Key? key,
    required this.nameEditingController,
    required this.passwordEditingController,
    required this.ensurePasswordEditingController,
    required this.handleRegister,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => PasswordAndNameStatePage();
}

class PasswordAndNameStatePage extends State<PasswordAndName> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              '设置信息',
              style: TextStyle(color: Colors.deepPurple, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: RegisterInput(
              controller: widget.nameEditingController,
              labelText: '昵称',
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
              obscureText: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: RegisterInput(
              controller: widget.passwordEditingController,
              labelText: '密码',
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.deepPurple,
              ),
              obscureText: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: RegisterInput(
              controller: widget.ensurePasswordEditingController,
              labelText: '确认密码',
              prefixIcon: const Icon(
                Icons.security,
                color: Colors.deepPurple,
              ),
              obscureText: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10.0), //3像素圆角
                    boxShadow: const [
                      //阴影
                      BoxShadow(color: Colors.deepPurpleAccent, blurRadius: 4.0)
                    ]),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 56,
                  child: TextButton(
                    onPressed: widget.handleRegister,
                    child: const Text(
                      "注册",
                      style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 5),
                    ),
                  ),
                )),
          )
        ]));
  }
}
