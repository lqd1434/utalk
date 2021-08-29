import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:myapp/utils/hex_color.dart';

class UserNameRow extends StatelessWidget {
  const UserNameRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, top: 20, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning,',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#ACB3C1')),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('Christam',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#5D5D5D'))),
              ],
            ),
            Column(
              children: [
                LikeButton(
                  size: 26,
                  circleColor: CircleColor(start: HexColor('#9181D6'), end: HexColor('#D4CEEF')),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: HexColor('#8C79DE'),
                    dotSecondaryColor: HexColor('#AFA2E8'),
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      isLiked ? Icons.thumb_up_alt : Icons.thumb_up_off_alt,
                      color: isLiked ? Colors.deepPurpleAccent : HexColor('#ACB3C1'),
                      size: 28,
                    );
                  },
                  likeCount: 665,
                  countBuilder: (int? count, bool isLiked, String text) {
                    var color = isLiked ? Colors.deepPurpleAccent : HexColor('#ACB3C1');
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "点赞",
                        style: TextStyle(color: color),
                      );
                    } else {
                      result = Text(
                        text,
                        style: TextStyle(color: color),
                      );
                    }
                    return result;
                  },
                ),
                // const SizedBox(height: 5),
                // Icon(
                //   Icons.thumb_up_alt,
                //   color: HexColor('#ACB3C1'),
                //   size: 28,
                // ),
                // const SizedBox(height: 5),
                // Text(
                //   '77789',
                //   style: TextStyle(
                //       fontSize: 14,
                //       letterSpacing: 0,
                //       fontWeight: FontWeight.w500,
                //       color: HexColor('#9794ED')),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
