import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/input_field.dart';

typedef HandleRegister = void Function(String username, String password);

class CompleteInfo extends StatefulWidget {
  final HandleRegister handleRegister;

  const CompleteInfo({Key? key, required this.handleRegister}) : super(key: key);

  @override
  _CompleteInfoState createState() => _CompleteInfoState();
}

class _CompleteInfoState extends State<CompleteInfo> {
  final TextEditingController _nameCtr = TextEditingController();
  final TextEditingController _passwordCtr = TextEditingController();
  final TextEditingController _ensurePwdCtr = TextEditingController();

  _handleClick() {
    if (_nameCtr.value.text.isNotEmpty &&
        _passwordCtr.value.text.isNotEmpty &&
        _ensurePwdCtr.value.text.isNotEmpty) {
      if (_passwordCtr.value.text == _ensurePwdCtr.value.text) {
        widget.handleRegister(_nameCtr.value.text, _passwordCtr.value.text);
      } else {
        BotToast.showText(
            text: '两次输入的密码不一致',
            contentColor: const Color.fromRGBO(245, 62, 62, 1),
            textStyle: const TextStyle(color: Colors.white));
      }
    } else {
      BotToast.showText(
          text: '信息不能为空',
          contentColor: const Color.fromRGBO(245, 62, 62, 1),
          textStyle: const TextStyle(color: Colors.white));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 360,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          InputField(
            controller: _nameCtr,
            prefixIcon: Icons.account_circle,
            hintText: '请输入账号名',
          ),
          InputField(
            controller: _passwordCtr,
            prefixIcon: Icons.lock,
            hintText: '请输入密码',
          ),
          InputField(
            controller: _ensurePwdCtr,
            prefixIcon: Icons.verified_user,
            hintText: '请确认密码',
          ),
          GestureDetector(
            onTap: _handleClick,
            child: Container(
              height: 60,
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              decoration:
                  BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(50)),
              child: const Text(
                '注册',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
