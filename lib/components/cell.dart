

import 'package:flutter/material.dart';

class Cell extends StatefulWidget{
  final Widget title;
  final Icon icon;
  const Cell({Key? key, required this.title, required this.icon}):super(key: key);

  @override
  State<StatefulWidget> createState()=>CellStatePage();
}

 class CellStatePage extends State<Cell>{

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
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
                    const SizedBox(width: 3,),
                    widget.title
                  ],
                ),
              )
          ),
          const Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.chevron_right)
          ),
        ],
      )
    );
  }
}