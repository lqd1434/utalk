import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/utils/hex_color.dart';

class Cell extends StatefulWidget {
  final Text title;
  final Icon icon;
  final bool? arrow;
  final Widget? tag;
  final double? titlePadding;
  final Color? backgroundColor;
  final BorderRadius? radius;
  final bool leftBorder;

  const Cell(
      {Key? key,
      required this.title,
      required this.icon,
      this.arrow = true,
      this.tag,
      this.titlePadding = 10,
      this.backgroundColor = Colors.white,
      this.radius,
      this.leftBorder = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CellStatePage();
}

 class CellStatePage extends State<Cell>{

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
            height: 40,
            padding: const EdgeInsets.only(left: 13),
            decoration: BoxDecoration(
                border: widget.leftBorder
                    ? Border(
                        left: BorderSide(
                            color: widget.title.style == null
                                ? HexColor('#666666')
                                : widget.icon.color!,
                            width: 4))
                    : null,
                borderRadius: widget.radius),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          widget.icon,
                          SizedBox(
                            width: widget.titlePadding,
                          ),
                          widget.title
                        ],
                ),
              )),
                Align(
                    alignment: Alignment.centerRight,
                    child: widget.tag ??
                        Icon(
                          Icons.chevron_right,
                          color: widget.title.style == null
                              ? HexColor('#666666')
                              : widget.title.style!.color,
                          size: (widget.icon.size),
                        ))
              ],
            )));
  }
}