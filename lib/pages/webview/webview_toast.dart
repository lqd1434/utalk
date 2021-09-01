import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:rive/rive.dart';

class WebViewToast {
  static showLoading(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: '',
        barrierColor: HexColor('#999999').withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return GestureDetector(
            onTap: () {
              cancelLoading(context);
            },
            child: Center(
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
            ),
          );
        });
  }

  static cancelLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  static showInfo(BuildContext context, String type, String text) {
    String iconName;
    Color color;
    switch (type) {
      case 'success':
        iconName = 'checkmark_icon.riv';
        color = Colors.green;
        break;
      case 'error':
        iconName = 'error_icon.riv';
        color = Colors.red;
        break;
      case 'waring':
        iconName = 'alert_icon.riv';
        color = HexColor('#FCB933');
        break;
      default:
        iconName = 'alert_icon.riv';
        color = HexColor('#FCB933');
        break;
    }
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
              height: 220,
              width: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: RiveAnimation.asset(
                      'static/flare/$iconName',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Material(
                    child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: AutoSizeText(
                          text,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: color, fontSize: 20),
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
