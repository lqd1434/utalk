import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/getx/getx_state.dart';

typedef VoidCallback = void Function();

class OpGrid extends StatefulWidget {
  const OpGrid({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => OpGridStatePage();
}

class OpGridStatePage extends State<OpGrid> {
  final GetxState getX = Get.find();

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, //横轴5个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widget
            ),
        children: const <Widget>[
          Icon(
            Icons.ac_unit,
            size: 35,
            color: Colors.lightBlueAccent,
          ),
          Icon(
            Icons.airport_shuttle,
            size: 35,
            color: Color.fromRGBO(223, 116, 114, 1),
          ),
          Icon(Icons.all_inclusive, size: 35, color: Color.fromRGBO(44, 189, 191, 1)),
          Icon(Icons.photo, size: 35, color: Color.fromRGBO(156, 26, 149, 1)),
          Icon(
            Icons.keyboard_arrow_down,
            size: 35,
            color: Colors.lightGreen,
          ),
        ]);
  }
}

class MoodTell extends StatefulWidget {
  const MoodTell({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MoodTellStatePage();
}

class MoodTellStatePage extends State<MoodTell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 8, 4, 0),
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey, width: 1, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(8, 5, 0, 5),
          child: Column(
            children: [
              Row(
                children: [
                  const RadiusImage(
                      image: NetworkImage('http://47.103.211.10:9090/static/images/avatar.png'),
                      widthAndHeight: 40,
                      radius: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '李清栋',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text('今天22:05',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13, color: Colors.grey)),
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text('今天真的好开心,'
                    '今天真的好开心,今天真的好开心,今天真的好开心,今天真的好开心,'
                    '今天真的好开心,今天真的好开心,'
                    '今天真的好开心'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(padding: EdgeInsets.only(right: 25), child: Icon(Icons.thumb_up)),
                  Padding(padding: EdgeInsets.only(right: 20), child: Icon(Icons.textsms)),
                  Padding(padding: EdgeInsets.only(right: 20), child: Icon(Icons.share)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
