import 'package:flutter/material.dart';
import 'package:myapp/utils/hex_color.dart';

import 'drawe_footer.dart';
import 'drawer_header.dart';
import 'drawer_menus.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.5, 0.5, 1],
            colors: [HexColor('#8289E8'), HexColor('#7F7FDA'), HexColor('#ADB1F0')]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const MyDrawerHeader(),
          Container(
            height: 350,
            width: double.maxFinite,
            margin: const EdgeInsets.only(top: 60, left: 30, right: 0),
            child: const DrawMenus(),
          ),
          const Padding(padding: EdgeInsets.only(top: 50, left: 10), child: MyDrawerFooter()),
        ],
      ),
    );
  }
}
