// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/style/inputStyle.dart';

class MyInput extends StatelessWidget{
  String hintText;
  Icon prefixIcon;
  bool obscureText;
  FocusNode? focusNode ;
  Color? color;
  TextEditingController textEditingController;

  MyInput({Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.focusNode,
    required this.textEditingController,
    this.color
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      cursorColor: const Color.fromRGBO(212, 255, 255, 1),
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        labelText: hintText,
        hoverColor: const Color.fromRGBO(212, 255, 255, 1),
        labelStyle: const TextStyle(color: Color.fromRGBO(212, 255, 255, 1)),
        border: myInputBorder,
        focusedBorder: myInputBorderFocusStyle,
        enabledBorder: myInputBorder,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusColor: const Color.fromRGBO(166, 255, 255, 1),
        prefixIcon: Container(
          width: 20,
          height: 20,
          alignment: Alignment.center,
          child: prefixIcon,
        ),
      ),
      obscureText: obscureText,
      style: const TextStyle(
          color:Color.fromRGBO(212, 255, 255, 1),
          fontSize: 20),
    );
  }

}