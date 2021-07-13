

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/cell.dart';
import 'package:myapp/components/circular_img.dart';


class MyDrawer extends StatefulWidget{

  const MyDrawer({Key? key}):super(key: key);
  @override
  State<StatefulWidget> createState()=>MyDrawerStatePage();
  
}

class MyDrawerStatePage extends State<MyDrawer>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(233, 245, 254, 1),
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 80),
        children: [
           const RadiusImage(
              radius: 50,
              widthAndHeight: 100,
              image: AssetImage('static/images/avatar.png')
          ),
          const SizedBox(height: 20),
          const Divider(),
          Container(
            height: 450,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children:const [
                ListTile(
                  title: Cell(
                        title: Text('情侣空间',style: TextStyle(fontSize: 22),),
                        icon: Icon(Icons.favorite,size: 26,)),
                ),
                ListTile(
                  title: Cell(
                      title: Text('我的收藏',style: TextStyle(fontSize: 22),),
                      icon: Icon(Icons.category,size: 26,)),
                ),
                ListTile(
                  title: Cell(
                      title: Text('我的相册',style: TextStyle(fontSize: 22),),
                      icon: Icon(Icons.collections,size: 26,)),
                ),
                ListTile(
                  title: Cell(
                      title: Text('装扮商店',style: TextStyle(fontSize: 22),),
                      icon: Icon(Icons.palette,size: 26,)),
                ),
                ListTile(
                  title: Cell(
                      title: Text('系统消息',style: TextStyle(fontSize: 22),),
                      icon: Icon(Icons.notifications,size: 26,)),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              GestureDetector(
                onTap: (){Get.toNamed('/setting');},
                child: Container(
                  width: 90,
                  height: 40,
                  padding:const EdgeInsets.only(left: 8),
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 1,style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children:const [
                      Icon(Icons.settings,size: 26),
                      Text('设置',style: TextStyle(fontSize: 22))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){Get.toNamed('/setting');},
                child: Container(
                  width: 90,
                  height: 40,
                  padding:const EdgeInsets.only(left: 8),
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 1,style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children:const [
                      Icon(Icons.dark_mode,size: 26),
                      Text('主题',style: TextStyle(fontSize: 22))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){Get.toNamed('/setting');},
                child: Container(
                  width: 90,
                  height: 80,
                  padding:const EdgeInsets.only(left: 8),
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 1,style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:const [
                      Icon(Icons.settings,size: 35),
                      Text('天气',style: TextStyle(fontSize: 16))
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  
}