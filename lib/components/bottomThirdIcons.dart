import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore_for_file: file_names,

class BottomThirdIcons extends StatelessWidget{
  final Color lineColor;
  final Color iconColor;

  const BottomThirdIcons({Key? key,required this.lineColor,required this.iconColor}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LineWidget(lineColor: lineColor),
        IconButton(
            onPressed: ()=>{},
            icon: Icon(ThirdIcon.ins,color: iconColor)
        ),
        IconButton(
            onPressed: ()=>{},
            icon: Icon(ThirdIcon.QQ,color: iconColor)
        ),
        IconButton(
            onPressed: ()=>{},
            icon: Icon(ThirdIcon.weChat,color:iconColor)
        ),
        LineWidget(lineColor: lineColor),
      ],
    );
  }

}


class LineWidget extends StatelessWidget {

  final Color lineColor;
  const LineWidget({Key? key,required this.lineColor}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 80,
      child: Divider(color:lineColor),
    );
  }
}

class ThirdIcon {
  static const IconData QQ = IconData(
      0xe64b,
      fontFamily: 'iconfont',
      matchTextDirection: true
  );

  static const IconData weChat = IconData(
      0xe7e5,
      fontFamily: 'iconfont',
      matchTextDirection: true
  );

  static const IconData ins = IconData(
      0xe664,
      fontFamily: 'iconfont',
      matchTextDirection: true
  );

}