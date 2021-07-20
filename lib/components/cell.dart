

import 'package:flutter/material.dart';

class Cell extends StatefulWidget{
  final Text title;
  final Icon icon;
  final bool? arrow;
  final Widget? tag;

  const Cell({Key? key, required this.title, required this.icon, this.arrow = true, this.tag})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CellStatePage();
}

 class CellStatePage extends State<Cell>{

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
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
                      const SizedBox(
                        width: 7,
                      ),
                      widget.title
                    ],
                ),
              )
          ),
            Align(
                alignment: Alignment.centerRight,
                child: widget.tag ??
                    Icon(
                      Icons.chevron_right,
                      color: widget.title.style!.color,
                      size: widget.icon.size,
                    )),
        ],
      )
    );
  }
}