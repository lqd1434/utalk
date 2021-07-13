import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/request/post.dart';
import 'package:myapp/response/response.dart';

import 'components.dart';

class RegisterCreate extends StatefulWidget {
  const RegisterCreate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<RegisterCreate> with SingleTickerProviderStateMixin {

  TextEditingController nameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController ensPswCtr = TextEditingController();
  TextEditingController verifyCtr = TextEditingController();
  Logger logger = Logger();

  bool _isVerify = false;

  _sendVerifyCode() async{
    final response =await sendRegisterEmail(emailCtr.value.text);
    NestRes res = NestRes.fromJson(response.data);
    if(res.statusCode==200){
      BotToast.showText(
          text:res.description,
          contentColor: const Color.fromRGBO(179, 247, 110, 1),
          textStyle: const TextStyle(color: Color.fromRGBO(76, 145, 8, 1))
      );
    } else{
      BotToast.showText(
          text:res.description,
          contentColor: const Color.fromRGBO(245, 62, 62, 1),
          textStyle: const TextStyle(color: Colors.white)
      );
    }
  }

  void _handleVerify() async{
    if(emailCtr.value.text.isEmail){
      if(verifyCtr.value.text.isNotEmpty){
        setState(() {
          _isVerify = true;
        });
      } else{
        BotToast.showText(
            text:"验证码不能为空",
            contentColor: const Color.fromRGBO(245, 62, 62, 1),
            textStyle: const TextStyle(color: Colors.white)
        );
      }
    } else{
      BotToast.showText(
          text:"邮箱格式错误",
          contentColor: const Color.fromRGBO(245, 62, 62, 1),
          textStyle: const TextStyle(color: Colors.white)
      );
    }
  }


  _handleRegister() async{
    logger.i(nameCtr.value.text);
    if(nameCtr.value.text.trim().isNotEmpty
        &&passwordCtr.value.text.trim().isNotEmpty
        &&ensPswCtr.value.text.trim().isNotEmpty
    ) {
      if(passwordCtr.value.text.trim()==ensPswCtr.value.text.trim()){
        final response=await doRegister(
            emailCtr.value.text.trim(),
            nameCtr.value.text.trim(),
            passwordCtr.value.text.trim(),
            verifyCtr.value.text.trim()
        );
        NestRes res = NestRes.fromJson(response.data);
        if(res.statusCode == 200){
          BotToast.showSimpleNotification(
            title: res.description,
            backgroundColor: const Color.fromRGBO(179, 255, 102, 1),
            titleStyle:const TextStyle(color:  Color.fromRGBO(76, 153, 0, 1)),
          );
          Get.offAllNamed("/home");
        } else{
          BotToast.showSimpleNotification(
            title: res.description,
            backgroundColor: const Color.fromRGBO(245, 62, 62, 1),
            titleStyle:const TextStyle(color:  Colors.white),
          );
        }
      } else{
        BotToast.showText(
            text:"两次输入的密码不一致",
            contentColor: const Color.fromRGBO(245, 62, 62, 1),
            textStyle: const TextStyle(color: Colors.white)
        );
      }
    } else{
      BotToast.showText(
          text:"输入不能为空",
          contentColor: const Color.fromRGBO(245, 62, 62, 1),
          textStyle: const TextStyle(color: Colors.white)
      );
    }
  }


  void _handleBack(){
    if(_isVerify){
      setState(() {
        _isVerify = false;
      });
    } else{
      Get.toNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){FocusScope.of(context).requestFocus(FocusNode());},
        child:Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('static/images/bg_register.jpeg'),
                fit: BoxFit.cover
              )
            ),
          ),
           Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
            child:  GestureDetector(
              onTap: _handleBack,
              child: Row(
                children:const [
                  Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                  Text('返回',style: TextStyle(color: Colors.white,fontSize: 17),)
                ],
              ),
            )
          ),
          Center(
              child:
              _isVerify ?
              PasswordAndName(
                handleRegister: _handleRegister,
                passwordEditingController: passwordCtr,
                ensurePasswordEditingController: ensPswCtr,
                nameEditingController: nameCtr,
              )
                  :
              EmailVerify(
                sendVerifyCode:_sendVerifyCode,
                handleVerify:_handleVerify,
                verifyCodeEditingController: verifyCtr,
                emailEditingController: emailCtr,)
          )
        ],
      ),
      )
    );
  }
}


