

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/components/cell.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/utils/hex_color.dart';

class MyDrawer extends StatefulWidget{

  const MyDrawer({Key? key}):super(key: key);
  @override
  State<StatefulWidget> createState()=>MyDrawerStatePage();
  
}

class MyDrawerStatePage extends State<MyDrawer>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor('#FFFFFF'),
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 80),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/personalHome');
                },
                child: RadiusImage(
                    radius: 40,
                    widthAndHeight: 80,
                    border: Border.all(color: HexColor('#653CB3')),
                    image: const AssetImage('static/images/avatar.png')),
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('sky', style: TextStyle(fontSize: 22, color: HexColor('#653CB3'))),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 150,
                    child: Text('一个人的爱总是如此的无力',
                        style: TextStyle(fontSize: 16, color: HexColor('#8DA4DD')),
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          Container(
            height: 480,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                ListTile(
                  title: Cell(
                      title: const Text(
                        '情侣空间',
                        style: TextStyle(fontSize: 22),
                      ),
                      icon: Icon(FontAwesomeIcons.solidHeart, color: HexColor('#E40100'))),
                ),
                ListTile(
                  title: Cell(
                      title: const Text(
                        '我的收藏',
                        style: TextStyle(fontSize: 22),
                      ),
                      icon: Icon(FontAwesomeIcons.boxOpen, color: HexColor('#00E3E4'))),
                ),
                ListTile(
                  title: Cell(
                      title: const Text(
                        '我的相册',
                        style: TextStyle(fontSize: 22),
                      ),
                      icon: Icon(FontAwesomeIcons.images, color: HexColor('#805AC8'))),
                ),
                ListTile(
                  title: Cell(
                      title: const Text(
                        '装扮商店',
                        style: TextStyle(fontSize: 22),
                      ),
                      icon: Icon(FontAwesomeIcons.palette, color: HexColor('#FFB1B1'))),
                ),
                ListTile(
                  title: Cell(
                      title: const Text(
                        '系统消息',
                        style: TextStyle(fontSize: 22),
                      ),
                      icon: Icon(FontAwesomeIcons.infoCircle, color: HexColor('#00DC88'))),
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
                  width: 70,
                  height: 80,
                  padding: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.cog, color: HexColor('#00E3E4')),
                      Text('设置', style: TextStyle(fontSize: 15, color: HexColor('#00E3E4')))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){Get.toNamed('/setting');},
                child: Container(
                  width: 70,
                  height: 80,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.calendarAlt, color: HexColor('#FF7F7E')),
                      Text('签到', style: TextStyle(fontSize: 15, color: HexColor('#FF7F7E')))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/rive');
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.cloud, color: HexColor('#8DA4DD')),
                      Text('天气', style: TextStyle(fontSize: 15, color: HexColor('#8DA4DD')))
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