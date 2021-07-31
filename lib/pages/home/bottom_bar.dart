import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/utils/hex_color.dart';

typedef ItemChangeCallback = void Function(int a);

class BottomBar extends StatefulWidget {
  final int selectedIndex;
  final ItemChangeCallback handleItemSelected;

  const BottomBar({Key? key, required this.selectedIndex, required this.handleItemSelected})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomBarStatePage();
}

class _BottomBarStatePage extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          // border: const Border.fromBorderSide(BorderSide(color: Colors.deepPurple)),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: HexColor('#8CA1EB'), blurRadius: 5),
          ]),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: GNav(
          gap: 5,
          rippleColor: Colors.deepPurple,
          color: Colors.deepPurple,
          tabBackgroundColor: Colors.deepPurple,
          activeColor: Colors.white,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          tabMargin: const EdgeInsets.symmetric(vertical: 10),
          backgroundColor: Colors.white,
          selectedIndex: widget.selectedIndex,
          onTabChange: (index) {
            widget.handleItemSelected(index);
          },
          tabs: const [
            GButton(text: '消息', icon: Icons.sms),
            GButton(text: '好友', icon: Icons.people),
            GButton(text: '应用', icon: Icons.camera),
            GButton(text: '我的', icon: Icons.face)
          ],
        ),
      ),
    );
  }
}
