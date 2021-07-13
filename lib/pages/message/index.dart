
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/swiper_action.dart';

class Message extends StatefulWidget{
  const Message({Key? key}):super(key: key);

  @override
  State<StatefulWidget> createState()=>MessageStatePage();

}

class MessageStatePage extends State<Message>{
  final Logger logger = Logger();


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: ListView.builder(
       itemBuilder: (BuildContext context, int index) {
         return SwiperAction(
           valueKey:ValueKey(index),
           child: const ListTile(
             leading:GFAvatar(),
             title:Text('lqd'),
             isThreeLine: false,
             subtitle: Text('今天真的好开心!',
                 softWrap: false, overflow: TextOverflow.ellipsis
             ),
           ),
         );
       },
       itemCount: 10,
     ),
   );
  }
}
