
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';


typedef SlidableActionCallback = void Function(BuildContext context,ValueKey valueKey);

class SwiperAction extends StatefulWidget{
  final Widget child;
  final ValueKey valueKey;

  const SwiperAction(
      {Key? key,required this.child,
        required this.valueKey,
      }):super(key: key);

  @override
  State<StatefulWidget> createState()=> SwiperActionStatePage();
}

class SwiperActionStatePage extends State<SwiperAction>{
  final Logger logger = Logger();


  _handleClickTop(BuildContext context,ValueKey valueKey){
    logger.i(valueKey);
  }

  _handleClickDelete(BuildContext context,ValueKey valueKey ){
    logger.i(valueKey);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: widget.valueKey,
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: (context){_handleClickTop(context,widget.valueKey);},
              backgroundColor: Colors.cyan,
              foregroundColor: Colors.white,
              icon: Icons.moving,
              label: '置顶',
            ),
            SlidableAction(
              onPressed: (context){_handleClickDelete(context,widget.valueKey);},
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: '删除',
            ),
          ],
        ),
        child: GestureDetector(
          onTap: (){Get.toNamed('/chat');},
          child: widget.child,
        )
    );
  }
}
