import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/utils/hex_color.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserInfoStatePage();
}

class _UserInfoStatePage extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.user,
                  color: HexColor('#666666'),
                  size: 18,
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 12, top: 0),
                  decoration: const BoxDecoration(
                      border:
                      Border(right: BorderSide(color: Colors.black, width: 1.5))),
                  child: Text(
                    '男',
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#666666')),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 12, top: 0, left: 12),
                  decoration: const BoxDecoration(
                      border:
                      Border(right: BorderSide(color: Colors.black, width: 1.5))),
                  child: Text(
                    '摩羯座',
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#666666')),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 12, top: 0, left: 12),
                  decoration: const BoxDecoration(
                      border:
                      Border(right: BorderSide(color: Colors.black, width: 1.5))),
                  child: Text(
                    '南昌大学',
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#666666')),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 12, top: 0, left: 12),
                  decoration: const BoxDecoration(
                      border:
                      Border(right: BorderSide(color: Colors.black, width: 1.5))),
                  child: Text(
                    '现居江西',
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#666666')),
                  ),
                ),
                const SizedBox(width: 20),
                Icon(
                  FontAwesomeIcons.chevronRight,
                  size: 18,
                  color: HexColor('#666666'),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 32),
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                '学生',
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w500,
                    color: HexColor('#666666')),
              ),
            ),
          ],
        ));
  }
}
