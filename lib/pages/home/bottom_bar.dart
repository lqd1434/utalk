import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration:
          const BoxDecoration(border: Border.fromBorderSide(BorderSide(color: Colors.deepPurple))),
      child: GNav(
        gap: 5,
        rippleColor: Colors.deepPurple,
        color: Colors.deepPurple,
        tabBackgroundColor: Colors.deepPurple,
        activeColor: Colors.white,
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
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
    );
  }
}
