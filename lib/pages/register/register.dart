import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/request/my_dio.dart';
import 'package:myapp/request/post.dart';
import 'package:myapp/response/response.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/save_login_data.dart';

import 'complete_info.dart';
import 'email_verify_view.dart';

class RegisterCreate extends StatefulWidget {
  const RegisterCreate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<RegisterCreate> with SingleTickerProviderStateMixin {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController ensPswCtr = TextEditingController();
  TextEditingController verifyCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  Logger logger = Logger();

  final SubmitState _submitState = SubmitState();

  bool _isVerify = false;
  Widget _viewBody = Container(color: Colors.white);
  final GetxState getX = Get.find();

  @override
  void initState() {
    super.initState();
    _viewBody = EmailVerifyView(
      changeView: _changeView,
    );
  }

  void _changeView(String email, String verifyCode) {
    print(verifyCode);
    setState(() {
      _submitState.email = email;
      _submitState.verifyCode = email;
      _viewBody = CompleteInfo(handleRegister: _handleRegister);
    });
  }

  _handleRegister(String username, String password) async {
    final response = await doRegister(
      _submitState.email,
      username,
      password,
      _submitState.verifyCode,
    );
    NestRes res = NestRes.fromJson(response.data);
    if (res.statusCode == 200) {
      BotToast.showSimpleNotification(
        title: res.description,
        backgroundColor: const Color.fromRGBO(179, 255, 102, 1),
        titleStyle: const TextStyle(color: Color.fromRGBO(76, 153, 0, 1)),
      );
      _login(_submitState.email, password);
    } else {
      BotToast.showSimpleNotification(
        title: res.description,
        backgroundColor: const Color.fromRGBO(245, 62, 62, 1),
        titleStyle: const TextStyle(color: Colors.white),
      );
    }
  }

  _login(String email, String password) async {
    try {
      var response = await DioManege.getInstance().dio!.post(
        'http://47.103.211.10:8080/login',
        data: {'email': email, 'password': password},
      );
      NestRes res = NestRes.fromJson(response.data);
      if (res.statusCode == 200) {
        saveLoginData(res.dataBody);
        getX.setUserInfo(res.dataBody!.user!);
        Get.offAllNamed('/home');
      } else {
        BotToast.showText(
            text: res.description,
            contentColor: const Color.fromRGBO(245, 62, 62, 1),
            textStyle: const TextStyle(color: Colors.white));
      }
    } catch (e) {
      BotToast.showText(
          text: '密码错误',
          contentColor: const Color.fromRGBO(245, 62, 62, 1),
          textStyle: const TextStyle(color: Colors.white));
    }
  }

  void _handleBack() {
    if (_isVerify) {
      setState(() {
        _isVerify = false;
      });
    } else {
      Get.toNamed('/auth');
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
                  HexColor('#9181D6'),
                  HexColor('#8774D5'),
                  HexColor('#7E83CB'),
                ])),
          ),
          Container(
              margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width - 120) / 2, 90, 0, 0),
              child: Column(
                children: [
                  Image.network(
                    'http://47.103.211.10:9090/static/images/pika.png',
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: const Text('注册', style: TextStyle(fontSize: 40, color: Colors.amber)),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
              child: GestureDetector(
                onTap: _handleBack,
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.amber,
                    ),
                    Text(
                      '返回',
                      style: TextStyle(color: Colors.amber, fontSize: 17),
                    )
                  ],
                ),
              )),
          Positioned(
              bottom: 120,
              width: MediaQuery.of(context).size.width,
              child: SizedBox(child: _viewBody)),
        ],
      ),
    ));
  }
}

class SubmitState {
  String email;
  String verifyCode;
  String username;
  String password;

  SubmitState({this.email = '', this.verifyCode = '', this.username = '', this.password = ''});
}
