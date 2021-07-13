// ignore_for_file: use_key_in_widget_constructors


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyBottomBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
          color:const Color.fromRGBO(204, 153, 255, 1.0),
          shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          child: Row(
            children: [
              Row(
                children: [
                  Padding(
                    padding:const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child:IconButton(onPressed: ()=>{}, icon: const Icon(Icons.home),iconSize: 40,padding:const EdgeInsets.fromLTRB(10,0,10,0)),
                  ),
                  IconButton(onPressed: ()=>{}, icon: const Icon(Icons.message),iconSize: 39,padding:const EdgeInsets.fromLTRB(10,5,10,0)),
                ],
              ),
              const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(icon: const Icon(Icons.camera),
                    iconSize: 40,
                    padding:const EdgeInsets.fromLTRB(10,0,10,0),
                    onPressed: ()=>{
                    },
                  ),
                  IconButton(
                      onPressed: ()=>{},
                      icon: const Icon(Icons.person),
                      iconSize: 40,
                      padding:const EdgeInsets.fromLTRB(10,0,10,0)),
                ],
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //均分底部导航栏横向空间
          ),
        );
  }
}