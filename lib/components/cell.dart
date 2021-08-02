import 'package:flutter/material.dart';
import 'package:myapp/utils/hex_color.dart';

class Cell extends StatefulWidget {
  final Text title;
  final Icon? icon;
  final bool? arrow;
  final Widget? rightWidget;
  final double? titlePadding;
  final Color? backgroundColor;
  final BorderRadius? radius;
  final bool leftBorder;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? boxShadowColor;
  final VoidCallback? onTap;

  const Cell(
      {Key? key,
      required this.title,
      this.icon,
      this.arrow = true,
      this.rightWidget,
      this.titlePadding = 10,
      this.backgroundColor = Colors.white,
      this.radius,
      this.leftBorder = false,
      this.boxShadowColor = Colors.grey,
      this.padding,
      this.margin,
      this.onTap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CellStatePage();
}

class CellStatePage extends State<Cell> {
  final EdgeInsetsGeometry childMargin = const EdgeInsets.symmetric(horizontal: 0, vertical: 10);
  final EdgeInsetsGeometry childPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? childMargin,
      padding: widget.padding ?? childPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: widget.boxShadowColor!, blurRadius: 3)],
      ),
      child: Material(
        child: Ink(
          color: widget.backgroundColor,
          child: InkWell(
            onTap: widget.onTap,
            child: Container(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 13),
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      border: widget.leftBorder
                          ? Border(
                              left: BorderSide(
                                  color: widget.icon == null
                                      ? HexColor('#9181D6')
                                      : widget.icon!.color!,
                                  width: 4))
                          : null,
                    ),
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
                                  widget.icon ?? const SizedBox(),
                                  widget.icon != null
                                      ? SizedBox(
                                          width: widget.titlePadding,
                                        )
                                      : const SizedBox(),
                                  widget.title
                                ],
                              ),
                            )),
                        Align(
                            alignment: Alignment.centerRight,
                            child: widget.rightWidget ??
                                Icon(
                                  Icons.chevron_right,
                                  color: widget.title.style == null
                                      ? HexColor('#666666')
                                      : widget.title.style!.color,
                                  size: 35,
                                ))
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
