import 'package:flutter/material.dart';

class TextTag extends StatefulWidget {
  final String content;
  final Color? color;
  final Color? bgColor;

  const TextTag({Key? key, required this.content, this.color, this.bgColor = Colors.grey})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => TextTagStatePage();
}

class TextTagStatePage extends State<TextTag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: widget.bgColor),
      child: Text(
        widget.content,
        style: TextStyle(color: widget.color),
      ),
    );
  }
}
