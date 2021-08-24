import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/utils/hex_color.dart';

typedef VoidCallback = void Function();

class MoodTell extends StatefulWidget {
  const MoodTell({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MoodTellStatePage();
}

class MoodTellStatePage extends State<MoodTell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 8, 5, 10),
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                const RadiusImage(
                    image: NetworkImage('http://47.103.211.10:9090/static/images/avatar.png'),
                    widthAndHeight: 40,
                    radius: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '李清栋',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      Text('今天22:05',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 11, color: Colors.grey)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const AutoSizeText(
              '很多时候我们会依赖一些异步数据来动态更新UI，'
              '比如在打开一个页面时我们需要先从互联网上获取数据，'
              '在获取数据的过程中我们显示一个加载框，'
              '等获取到数据时我们再渲染页面；',
              maxLines: 5,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: getLikeButton(),
              ),
              // Padding(padding: EdgeInsets.only(right: 20), child: Icon(Icons.thumb_up_off_alt)),
              const Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.textsms)),
              const Padding(padding: EdgeInsets.only(right: 20), child: Icon(Icons.share)),
            ],
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 0),
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(Icons.thumb_up_alt, size: 26),
                ),
                Expanded(
                  child: AutoSizeText(
                    '马云,马化腾觉得很赞',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            alignment: Alignment.center,
            decoration:
                BoxDecoration(color: HexColor('#F5F8FA'), borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.only(top: 10, left: 10),
            margin: const EdgeInsets.only(top: 5, left: 10, right: 20, bottom: 10),
            child: const TextField(
              style: TextStyle(fontSize: 16, letterSpacing: 1),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: '评论',
                hintStyle: TextStyle(fontSize: 15, letterSpacing: 1, color: Colors.black45),
                filled: false,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget getLikeButton() {
  return LikeButton(
    size: 26,
    circleColor: CircleColor(start: HexColor('#9181D6'), end: HexColor('#D4CEEF')),
    bubblesColor: BubblesColor(
      dotPrimaryColor: HexColor('#8C79DE'),
      dotSecondaryColor: HexColor('#AFA2E8'),
    ),
    likeBuilder: (bool isLiked) {
      return Icon(
        isLiked ? Icons.thumb_up_alt : Icons.thumb_up_off_alt,
        color: isLiked ? Colors.deepPurpleAccent : Colors.black,
        size: 26,
      );
    },
    likeCount: 665,
    countBuilder: (int? count, bool isLiked, String text) {
      var color = isLiked ? Colors.deepPurpleAccent : Colors.black;
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
  );
}
