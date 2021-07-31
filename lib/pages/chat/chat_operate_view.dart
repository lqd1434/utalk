import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/cell.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/utils/hex_color.dart';

class ImageCell extends StatefulWidget {
  final ImageProvider? img;
  final String text;
  final Widget? child;
  final double? fontSize;

  const ImageCell({Key? key, this.img, required this.text, this.child, this.fontSize})
      : super(key: key);

  @override
  _ImageCellState createState() => _ImageCellState();
}

class _ImageCellState extends State<ImageCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/personalHome', arguments: '/chatSetting');
      },
      child: Row(
        children: [
          widget.img != null
              ? RadiusImage(
                  image: widget.img!,
                  widthAndHeight: 50,
                  radius: 25,
                  boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
                )
              : Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: HexColor('#DADADA'), shape: BoxShape.circle),
                  child: widget.child,
                ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Text(
            widget.text,
            style: TextStyle(fontSize: widget.fontSize),
          )),
          const SizedBox(
            width: 50,
            child: Icon(
              Icons.chevron_right,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}

class GridSetting extends StatefulWidget {
  const GridSetting({Key? key}) : super(key: key);

  @override
  _GridSettingState createState() => _GridSettingState();
}

class _GridSettingState extends State<GridSetting> {
  final GlobalKey _key = GlobalKey();
  double _squareHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => {
          setState(() {
            _squareHeight = _key.currentContext!.size!.width;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              key: _key,
              height: _squareHeight == 0 ? 60 : _squareHeight - 30,
              margin: const EdgeInsets.only(right: 10, left: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [Icon(Icons.search, size: 30), Text('聊天记录')],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 5),
              height: _squareHeight == 0 ? 60 : _squareHeight - 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [Icon(Icons.image, size: 30), Text('聊天背景')],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 5, left: 10),
              height: _squareHeight == 0 ? 60 : _squareHeight - 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        '22',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        '天',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Text('成为好友')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OpList extends StatefulWidget {
  const OpList({Key? key}) : super(key: key);

  @override
  _OpListState createState() => _OpListState();
}

class _OpListState extends State<OpList> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 15),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
      ),
      child: Column(
        children: [
          Cell(
            boxShadowColor: Colors.transparent,
            backgroundColor: Colors.white,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            title: const Text(
              '设为置顶',
              style: TextStyle(fontSize: 19),
            ),
            rightWidget: CupertinoSwitch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
          const Divider(),
          Cell(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            boxShadowColor: Colors.transparent,
            backgroundColor: Colors.white,
            title: const Text(
              '消息免打扰',
              style: TextStyle(fontSize: 19),
            ),
            rightWidget: CupertinoSwitch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
          const Divider(),
          Cell(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            boxShadowColor: Colors.transparent,
            backgroundColor: Colors.white,
            title: const Text(
              '特别关心',
              style: TextStyle(fontSize: 19),
            ),
            rightWidget: CupertinoSwitch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
          const Divider(),
          Cell(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            boxShadowColor: Colors.transparent,
            backgroundColor: Colors.white,
            title: const Text(
              '隐藏会话',
              style: TextStyle(fontSize: 19),
            ),
            rightWidget: CupertinoSwitch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
          const Divider(),
          Cell(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            boxShadowColor: Colors.transparent,
            backgroundColor: Colors.white,
            title: const Text(
              '屏蔽此人',
              style: TextStyle(fontSize: 19),
            ),
            rightWidget: CupertinoSwitch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
