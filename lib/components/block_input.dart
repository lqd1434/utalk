import 'package:flutter/material.dart';

class BlockInput extends StatefulWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Color? fillColor;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? placeholderStyle;
  final String? placeholder;
  final TextStyle? contentStyle;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool isSafe;
  final FloatingLabelBehavior? floatingLabelBehavior;

  const BlockInput({
    Key? key,
    this.focusNode,
    this.controller,
    this.labelText,
    this.labelStyle,
    this.border,
    this.prefixIcon,
    this.suffixIcon,
    this.isSafe = false,
    this.contentStyle,
    this.focusedBorder,
    this.fillColor,
    this.floatingLabelBehavior,
    this.placeholderStyle,
    this.placeholder,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => BlockInputStatePage();
}

class BlockInputStatePage extends State<BlockInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        focusNode: widget.focusNode,
        strutStyle: const StrutStyle(leading: 0, height: 1.1),
        cursorColor: const Color.fromRGBO(212, 255, 255, 1),
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          labelText: widget.labelText,
          hintText: widget.placeholder,
          labelStyle: widget.labelStyle,
          border: widget.border,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusColor: Colors.white,
          floatingLabelBehavior: widget.floatingLabelBehavior,
          prefixIcon: Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            child: widget.prefixIcon,
          ),
          suffixIcon: Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            child: widget.suffixIcon,
          ),
        ),
        obscureText: widget.isSafe,
        style: widget.contentStyle);
  }
}
