import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myapp/components/list_tile.dart';
import 'package:myapp/utils/hex_color.dart';

class FriendList<T> extends StatefulWidget {
  final T? items;

  const FriendList({Key? key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FriendListStatePage();
}

class FriendListStatePage extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(0),
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: 30,
            padding: const EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                          child: UserTile(
                        image: const NetworkImage(
                          'http://47.103.211.10:9090/static/images/avatar.png',
                        ),
                        title: Text('sky',
                            style: TextStyle(
                                fontSize: 18,
                                color: HexColor('#653CB3'),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5)),
                        subText: Text('今天真的好开心!',
                            style: TextStyle(fontSize: 13, color: HexColor('#8C9EE9')),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis),
                      ))));
            },
          ),
        ));
  }
}
