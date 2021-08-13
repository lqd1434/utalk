import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/pages/personal_home/user_info.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/read_file.dart';

import 'components.dart';

class PersonalHome extends StatefulWidget {
  const PersonalHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PersonalHomeStatePage();
}

class _PersonalHomeStatePage extends State<PersonalHome> {
  final _scrollController = ScrollController();
  Logger logger = Logger();
  bool isShowBg = false;

  // GlobalKey<_AppBarState> _barKey = GlobalKey();
  String from = '';
  late StateSetter _appBarSetter;

  @override
  void initState() {
    super.initState();
    if (Get.previousRoute == '/chatSetting' ||
        Get.previousRoute == '/home' ||
        Get.previousRoute == '/chat') {
      from = Get.previousRoute;
    }
    _scrollController.addListener(() {
      if (_scrollController.offset <= 100) {
        if (isShowBg) {
          isShowBg = false;
          _appBarSetter(() {});
        }
        // _barKey.currentState!.changeShow(false);
      } else {
        if (!isShowBg) {
          isShowBg = true;
          _appBarSetter(() {});
        }
        // _barKey.currentState!.changeShow(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
            _appBarSetter = setState;
            return AppBar(
              centerTitle: true,
              elevation: 3,
              title: isShowBg ? const Text('我的资料', style: TextStyle(fontSize: 18)) : null,
              shadowColor: isShowBg ? Colors.grey : Colors.transparent,
              backgroundColor: isShowBg ? Colors.white : Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Get.offAndToNamed(from);
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 35,
                  )),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(top: 17, right: 10),
                  child: Text(
                    '更多',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            );
          }),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Stack(children: [
            Container(
              height: 900,
              color: HexColor('#FFFBFA'),
            ),
            getBgImg(),
            Positioned(left: 120, top: 208, child: getUserName()),
            Positioned(right: 20, top: 180, child: getApprove()),
            Positioned(left: 120, top: 245, child: getNumberInfo()),
            const Positioned(top: 315, left: 20, child: UserInfo()),
            Positioned(top: 385, left: 20, child: getNickName()),
            Positioned(top: 435, left: 20, child: getSignText()),
            Positioned(left: 20, top: 485, child: getSpace()),
            Positioned(left: 20, top: 530, child: getGallery()),
            Positioned(left: 20, top: 575, child: getPictures()),
            Positioned(left: 30, top: 200, child: getUserIcon(loadIcon())),
          ]),
        ));
  }
}

// class _AppBar extends StatefulWidget {
//   final Key key;
//
//   const _AppBar(this.key);
//
//   @override
//   _AppBarState createState() => _AppBarState();
// }
//
// class _AppBarState extends State<_AppBar> {
//   bool _isShowBg = false;
//   String from = '';
//
//   @override
//   void initState() {
//     super.initState();
//     String from = '';
//     if (Get.previousRoute == '/chatSetting' ||
//         Get.previousRoute == '/home' ||
//         Get.previousRoute == '/chat') {
//       from = Get.previousRoute;
//     }
//   }
//
//   void changeShow(bool isShowBg) {
//     if (isShowBg) {
//       if (!_isShowBg) {
//         setState(() {
//           _isShowBg = true;
//         });
//       }
//     } else {
//       if (_isShowBg) {
//         setState(() {
//           _isShowBg = false;
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       centerTitle: true,
//       elevation: 3,
//       title: _isShowBg ? const Text('我的资料', style: TextStyle(fontSize: 18)) : null,
//       shadowColor: _isShowBg ? Colors.grey : Colors.transparent,
//       backgroundColor: _isShowBg ? Colors.white : Colors.transparent,
//       leading: IconButton(
//           onPressed: () {
//             Get.offAndToNamed(from);
//           },
//           icon: const Icon(
//             Icons.chevron_left,
//             size: 35,
//           )),
//       actions: const [
//         Padding(
//           padding: EdgeInsets.only(top: 17, right: 10),
//           child: Text(
//             '更多',
//             style: TextStyle(fontSize: 18),
//           ),
//         )
//       ],
//     );
//   }
// }
