import 'package:flutter/material.dart';

class BlockButton extends StatefulWidget {
  final LinearGradient? gradient;
  final Widget text;
  final VoidCallback? handlePress;
  final double borderRadius;

   const BlockButton({Key? key,
    this.gradient,
    required this.text,
    this.handlePress,
    this.borderRadius=10.0}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BlockButtonStatePage();
}

class BlockButtonStatePage extends State<BlockButton> {
  @override
  Widget build(BuildContext context) {
   return DecoratedBox(
       decoration: BoxDecoration(
           gradient: widget.gradient,
           borderRadius: BorderRadius.circular(widget.borderRadius),//3像素圆角
           boxShadow:const [
             BoxShadow(
                 color: Color.fromRGBO(212, 255, 255, 1),
                 blurRadius: 10.0)
           ]),
       child: TextButton(
         onPressed: widget.handlePress,
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.5),
           child: widget.text
         ),
       ));
  }
}
