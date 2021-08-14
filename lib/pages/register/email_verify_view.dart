import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/input_field.dart';
import 'package:myapp/request/post.dart';
import 'package:myapp/response/response.dart';

typedef ChangeViewFunc = void Function(String email, String verifyCode);

class EmailVerifyView extends StatefulWidget {
  final ChangeViewFunc changeView;

  const EmailVerifyView({Key? key, required this.changeView}) : super(key: key);

  @override
  _EmailVerifyViewState createState() => _EmailVerifyViewState();
}

class _EmailVerifyViewState extends State<EmailVerifyView> {
  final TextEditingController _verifyCtr = TextEditingController();
  final TextEditingController _emailCtr = TextEditingController();

  int _timeCount = 60;
  Timer? countDownTimer;

  _sendVerifyCode() async {
    final response = await sendRegisterEmail(_emailCtr.value.text);
    NestRes res = NestRes.fromJson(response.data);
    if (res.statusCode == 200) {
      BotToast.showText(
          text: res.description,
          contentColor: const Color.fromRGBO(179, 247, 110, 1),
          textStyle: const TextStyle(color: Color.fromRGBO(76, 145, 8, 1)));
    } else {
      BotToast.showText(
          text: res.description,
          contentColor: const Color.fromRGBO(245, 62, 62, 1),
          textStyle: const TextStyle(color: Colors.white));
    }
  }

  handleClick() {
    if (_emailCtr.value.text.isNotEmpty) {
      _sendVerifyCode();
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

  _verify() {
    if (_verifyCtr.value.text.isNotEmpty) {
      widget.changeView(_emailCtr.value.text, _verifyCtr.value.text);
    } else {
      BotToast.showText(
          text: '验证码不能为空',
          contentColor: const Color.fromRGBO(245, 62, 62, 1),
          textStyle: const TextStyle(color: Colors.white));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 300,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          InputField(
            controller: _emailCtr,
            prefixIcon: Icons.account_circle,
            hintText: '请输入邮箱',
          ),
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 210,
                  child: InputField(
                    controller: _verifyCtr,
                    prefixIcon: Icons.security,
                    hintText: '验证码',
                  ),
                ),
                GestureDetector(
                  onTap: handleClick,
                  child: Container(
                    width: 90,
                    height: 55,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 20, top: 15),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple, borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      _timeCount == 60 ? '获取' : '$_timeCount秒',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: _verify,
            child: Container(
              height: 60,
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              decoration:
                  BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(50)),
              child: const Text(
                '验证',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
