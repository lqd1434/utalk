import 'package:flutter/material.dart';
import 'package:myapp/utils/hex_color.dart';

import 'drawe_footer.dart';
import 'drawer_header.dart';
import 'drawer_menu.dart';

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
        gradient: LinearGradient(colors: [
          HexColor('#CE9FFC'),
          HexColor('#B2A7E2'),
          HexColor('#7367F0'),
        ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyDrawerHeader(),
          const SizedBox(height: 20),
          const Divider(),
          Container(
            height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: const EdgeInsets.only(top: 50, left: 15, right: 10),
            child: const MyDrawerMenu(),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 130, left: 10, bottom: 20), child: MyDrawerFooter())
        ],
      ),
    );
  }
}
