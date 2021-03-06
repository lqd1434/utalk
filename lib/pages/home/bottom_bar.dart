import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
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

class _BottomBarStatePage extends State<BottomBar> with SingleTickerProviderStateMixin {
  bool isShow = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _animation = Tween<double>(begin: 0, end: 1.0)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
            visible: isShow,
            maintainSize: false,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return FadeTransition(
                    opacity: _animation,
                    child: Transform(
                        transform: Matrix4.translationValues(0, 60 * (1.0 - _animation.value), 0),
                        child: child));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: HexColor('#8CA1EB'), blurRadius: 5),
                    ]),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 72),
                      color: Colors.transparent,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 40,
                            width: 80,
                            margin: const EdgeInsets.only(top: 15, left: 8, right: 5, bottom: 92),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: HexColor('#7F7FDA'),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(navItems[index].route);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    navItems[index].icon,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    navItems[index].name,
                                    style: const TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                        top: 13,
                        right: 10,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.cancel, size: 40, color: HexColor('#5757CF')),
                          onPressed: () {
                            _animationController.reverse();
                            Future.delayed(const Duration(milliseconds: 800), () {
                              setState(() {
                                isShow = false;
                              });
                            });
                          },
                        ))
                  ],
                ),
              ),
            )),
        Positioned(
          bottom: isShow ? 0 : null,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
            decoration: BoxDecoration(
                color: Colors.white,
                // border: const Border.fromBorderSide(BorderSide(color: Colors.deepPurple)),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: HexColor('#8CA1EB'), blurRadius: 5),
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Slidable(
                key: const ValueKey(1),
                endActionPane: ActionPane(
                  extentRatio: 0.24,
                  motion: const ScrollMotion(),
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (isShow) {
                          _animationController.reverse();
                          Future.delayed(const Duration(milliseconds: 800), () {
                            setState(() {
                              isShow = false;
                            });
                          });
                        } else {
                          setState(() {
                            isShow = true;
                          });
                          _animationController.forward();
                        }
                      },
                      child: Container(
                        height: 45,
                        width: 70,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        decoration: BoxDecoration(
                          color: HexColor('#5757CF'),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Text(
                          '?????????',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: GNav(
                    gap: 5,
                    rippleColor: HexColor('#7F7FDA'),
                    color: HexColor('#7F7FDA'),
                    tabBackgroundColor: HexColor('#7F7FDA'),
                    activeColor: Colors.white,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    tabMargin: const EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: Colors.white,
                    selectedIndex: widget.selectedIndex,
                    onTabChange: (index) {
                      widget.handleItemSelected(index);
                    },
                    tabs: const [
                      GButton(text: '??????', icon: Icons.sms),
                      GButton(text: '??????', icon: Icons.people),
                      GButton(text: '??????', icon: Icons.camera),
                      GButton(text: '??????', icon: Icons.face)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<NavItem> navItems = [
  NavItem('/space', '??????', Icons.star_border),
  NavItem('space', '??????', Icons.add),
  NavItem('space', '??????', Icons.favorite),
];

class NavItem {
  String route;
  String name;
  IconData icon;

  NavItem(this.route, this.name, this.icon);
}
