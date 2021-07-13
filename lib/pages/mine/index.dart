

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/getwidget.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/components/swiper_action.dart';
import 'package:get/get.dart';
import 'package:myapp/getx/getx_state.dart';


class Mine extends StatefulWidget{
  const Mine({Key? key}):super(key: key);

  @override
  State<StatefulWidget> createState()=>MineStatePage();

}

class MineStatePage extends State<Mine>{
  final Logger logger = Logger();

  _handleBack(){
    Navigator.popAndPushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 180,
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        padding: const EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        color: Colors.white,
                        child: const Text('李清栋',style: TextStyle(fontSize: 20),),
                      ),
                      Container(height: 110,color: Colors.greenAccent),
                    ],
                  ),
                ),
                Container(
                  width: 130,
                  color: Colors.blue,
                  child: const RadiusImage(
                      image: AssetImage('static/images/avatar.png'),
                      widthAndHeight: 90, radius: 45,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 200,
              color: Colors.red,
            ),
          )
        ],
      )
    );
  }
}