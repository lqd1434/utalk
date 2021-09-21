import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/webview/webview_bottom_sheet.dart';
import 'package:myapp/utils/hex_color.dart';

PreferredSize webViewHeader(
    {required BuildContext context,
    required double appBarHeight,
    Widget? title,
    Widget? leading,
    IconData? leftIcon,
    required VoidCallback fullscreenFunc}) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, appBarHeight),
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: title,
      leading: leading,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 50,
                height: 31,
                child: TextButton(
                  onPressed: () {
                    Get.bottomSheet(webviewSheet(fullscreenFunc));
                  },
                  style: _btnStyleLeft(),
                  child: Container(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 0.3),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          )),
                      child: Icon(
                        leftIcon ?? Icons.more_horiz,
                        size: 28,
                      )),
                ),
              ),
              SizedBox(
                width: 50,
                height: 31,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed('/home');
                  },
                  style: _btnStyleRight(),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 0.3),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: const Icon(
                        Icons.power_settings_new,
                        size: 28,
                      )),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

_btnStyleLeft() {
  return ButtonStyle(
      enableFeedback: true,
      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
      elevation: MaterialStateProperty.all(0),
      overlayColor: MaterialStateProperty.all(HexColor('#CCCCCC')),
      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)))),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.resolveWith((state) {
        return Colors.black54;
      }));
}

_btnStyleRight() {
  return ButtonStyle(
      enableFeedback: true,
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      elevation: MaterialStateProperty.all(0),
      overlayColor: MaterialStateProperty.all(HexColor('#CCCCCC')),
      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(bottomRight: Radius.circular(30), topRight: Radius.circular(30)))),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.resolveWith((state) {
        return Colors.black54;
      }));
}
