import 'package:flutter/material.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/utils/hex_color.dart';

class FavoriteList extends StatefulWidget {
  final AnimationController animationController;

  const FavoriteList({Key? key, required this.animationController}) : super(key: key);

  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 15),
            width: MediaQuery.of(context).size.width - 280,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 65,
                  width: 65,
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: HexColor('#7F7FDA')),
                    color: HexColor('#5757CF').withOpacity(0.5),
                  ),
                  child: Stack(
                    children: const [
                      Positioned(
                        top: 2,
                        left: 6,
                        child: Text(
                          '特别',
                          style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 4),
                        ),
                      ),
                      Positioned(
                          top: 22,
                          left: 16,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                          )),
                      Positioned(
                        bottom: 2,
                        left: 6,
                        child: Text(
                          '关心',
                          style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 4),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
        Container(
          height: 60,
          alignment: Alignment.center,
          width: 280,
          margin: const EdgeInsets.only(top: 15),
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 16, left: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: widget.animationController,
                      curve: Interval((1 / 10) * index, 1.0, curve: Curves.fastOutSlowIn)));
              widget.animationController.forward();
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget? child) {
                    return FadeTransition(
                        opacity: animation,
                        child: Transform(
                            transform:
                                Matrix4.translationValues(100 * (1.0 - animation.value), 0.0, 0.0),
                            child: child));
                  },
                  child: index == 9
                      ? Container(
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: HexColor('#7F7FDA')),
                              color: HexColor('#E9EDF7').withOpacity(0.5),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: HexColor('#7F7FDA'),
                          ),
                        )
                      : RadiusImage(
                          border: Border.all(color: HexColor('#7F7FDA')),
                          widthAndHeight: 60,
                          radius: 30,
                          image: const NetworkImage(
                            'http://47.103.211.10:9090/static/images/avatar.png',
                          ),
                        ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
