// ignore_for_file: file_names,

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/bottomThirdIcons.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  void handleTap(BuildContext context, String navType) {
    if (navType == 'register') {
      Navigator.popAndPushNamed(context, '/register');
    } else if (navType == 'login') {
      Navigator.popAndPushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Image(
              image: AssetImage('static/images/bgcube.png'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 125,
              left: 30,
              child: GestureDetector(
                onTap: () => handleTap(context, 'login'),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(232, 157, 156, 1),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [BoxShadow(color:  Color.fromRGBO(240, 172, 169, 1),blurRadius: 10,)],
                        border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(232, 157, 156, 1))),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      child: Text('登录'),
                    )),
              )),
          Positioned(
            bottom: 125,
            right: 30,
            child: GestureDetector(
              onTap: () => handleTap(context, 'register'),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(110, 242, 248, 0.7),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:const [BoxShadow(color:  Color.fromRGBO(204, 255, 255, 1),blurRadius: 10,)],
                      border: Border.all(
                          width: 1, color: const Color.fromRGBO(0, 0, 0, 1))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    child: Text('注册'),
                  )),
            ),
          ),
          const Positioned(
              bottom: 30,
              left: 25,
              child: BottomThirdIcons(
                iconColor: Color.fromRGBO(251, 169, 157, 1),
                lineColor: Color.fromRGBO(250, 125, 108, 1),
              ))
        ],
      ),
    );
  }
}
