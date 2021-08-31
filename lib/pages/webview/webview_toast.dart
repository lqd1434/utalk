import 'package:flutter/material.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:rive/rive.dart';

class WebViewToast {
  static showLoading(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: HexColor('#999999').withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Center(
            child: Container(
              height: 150,
              width: 150,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const RiveAnimation.asset(
                'static/flare/runner_boy.riv',
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }
}
