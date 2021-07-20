import 'package:flutter/material.dart';
import 'package:myapp/components/cell.dart';

class MyCountInfo extends StatefulWidget {
  const MyCountInfo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyCountInfoStatePage();
}

class MyCountInfoStatePage extends State<MyCountInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('222', style: TextStyle(fontSize: 22, color: Colors.orange)),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('15', style: TextStyle(fontSize: 22, color: Colors.green)),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('88', style: TextStyle(fontSize: 22, color: Colors.blue)),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('点赞', style: TextStyle(fontSize: 16, color: Colors.orange)),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('动态', style: TextStyle(fontSize: 16, color: Colors.green)),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                child: const Text('心情', style: TextStyle(fontSize: 16, color: Colors.blue)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MineCellGroup extends StatefulWidget {
  const MineCellGroup({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MineCellGroupStatePage();
}

class MineCellGroupStatePage extends State<MineCellGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const Cell(
                title: Text(
                  '好友动态',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                ),
                icon: Icon(
                  Icons.stars,
                  color: Colors.orange,
                  size: 28,
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const Cell(
                title: Text(
                  '与你相遇',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                ),
                icon: Icon(
                  Icons.public,
                  color: Colors.blue,
                  size: 28,
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const Cell(
                title: Text(
                  '触人心弦',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 28,
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const Cell(
                title: Text(
                  '温暖祝福',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                ),
                icon: Icon(
                  Icons.cake,
                  color: Colors.deepPurple,
                  size: 28,
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const Cell(
                title: Text(
                  '共同参与',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                ),
                icon: Icon(
                  Icons.support,
                  color: Colors.green,
                  size: 28,
                )),
          ),
        ],
      ),
    );
  }
}
