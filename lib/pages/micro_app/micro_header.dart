import 'package:flutter/material.dart';

class MicroHeader extends StatefulWidget {
  final AnimationController? animationController;
  final Animation? animation;

  const MicroHeader({Key? key, this.animationController, this.animation}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MicroHeaderStatePage();
}

class MicroHeaderStatePage extends State<MicroHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text('微应用',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.lightBlue)),
        ),
        Container(
          width: 130,
          child: Row(
            children: const [
              Icon(Icons.arrow_back_ios_new, color: Color.fromRGBO(140, 161, 235, 1)),
              SizedBox(width: 10),
              Icon(Icons.event, color: Color.fromRGBO(140, 161, 235, 1)),
              SizedBox(width: 5),
              Text(
                'Wed',
                style:
                    TextStyle(color: Color.fromRGBO(140, 161, 225, 1), fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios, color: Color.fromRGBO(140, 161, 235, 1)),
            ],
          ),
        )
      ],
    );
  }
}
