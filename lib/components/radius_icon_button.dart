import 'package:flutter/material.dart';

class RadiusIconBtn extends StatelessWidget {
  final Color? background;
  final Color? color;
  final Color? splashColor;
  final double radius;
  final double? size;
  final IconData? icon;
  final double padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;

  const RadiusIconBtn(
      {Key? key,
      this.background = Colors.white,
      this.color = Colors.black,
      this.radius = 10,
      this.size = 30,
      this.icon,
      this.padding = 8,
      this.onPressed,
      this.splashColor,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(radius)),
        child: IconButton(
          padding: EdgeInsets.all(padding),
          splashColor: splashColor,
          icon: Icon(icon, size: size, color: color),
          onPressed: onPressed,
        ));
  }
}
