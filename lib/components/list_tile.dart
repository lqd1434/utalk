import 'package:flutter/material.dart';
import 'package:myapp/utils/hex_color.dart';

import 'circular_img.dart';

class UserTile extends StatefulWidget {
  final ImageProvider? image;
  final Widget? title;
  final Widget? subText;

  const UserTile({Key? key, this.title, this.subText, this.image}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserTileStatePage();
}

class _UserTileStatePage extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(right: 10, bottom: 5),
              decoration: BoxDecoration(
                  color: widget.image != null ? HexColor('#9E80D5') : null, shape: BoxShape.circle),
              child: widget.image != null
                  ? RadiusImage(
                      image: widget.image!,
                      radius: 25,
                      widthAndHeight: 50,
                      border: Border.all(color: HexColor('#B7C2F1')),
                    )
                  : null,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 25,
                    margin: const EdgeInsets.only(bottom: 0),
                    color: widget.title == null ? HexColor('#9E80D5') : null,
                    child: widget.title,
                  ),
                  Container(
                    width: 250,
                    height: 18,
                    margin: const EdgeInsets.only(top: 0),
                    color: widget.title == null ? HexColor('#9E80D5') : null,
                    child: widget.subText,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: DecoratedBox(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('3', style: TextStyle(color: Colors.white)),
                ),
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurpleAccent),
              ),
            )
          ],
        ));
  }
}
