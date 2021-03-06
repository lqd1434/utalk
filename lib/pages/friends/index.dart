import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/components/my_animation.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/pages/home/HomePage.dart';
import 'package:myapp/utils/hex_color.dart';

import 'components.dart';
import 'online_model.dart';

class Friends extends StatefulWidget {
  final AnimationController? animationController;

  const Friends({Key? key, this.animationController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FriendsStatePage();
}

class FriendsStatePage extends State<Friends> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final GetxState gexState = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => {gexState.changeIsShowAppBar(true)});
  }

  @override
  Widget build(BuildContext context) {
    widget.animationController?.forward();
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          child: Column(
            children: [
              MyFadeTransition(
                  myAnimationController: widget.animationController!,
                  myAnimation: myAnimation(widget.animationController!, 2),
                  child: Container(
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]),
                    child: GNav(
                      gap: 5,
                      rippleColor: HexColor('#7F7FDA'),
                      color: HexColor('#7F7FDA'),
                      tabBackgroundColor: HexColor('#7F7FDA'),
                      activeColor: Colors.white,
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                      tabMargin: const EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: Colors.white,
                      selectedIndex: _currentIndex,
                      onTabChange: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                        _pageController.jumpToPage(index);
                      },
                      tabs: const [
                        GButton(text: '??????', icon: Icons.online_prediction),
                        GButton(text: '??????', icon: Icons.people),
                        GButton(text: '??????', icon: Icons.camera),
                        GButton(text: '????????????', icon: Icons.favorite)
                      ],
                    ),
                  )),
              Flexible(
                child: PageView(
                  controller: _pageController,
                  // physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children: <Widget>[
                    MyFadeTransition(
                        myAnimationController: widget.animationController!,
                        myAnimation: myAnimation(widget.animationController!, 3),
                        child: OnlineModelList(
                          animationController: widget.animationController,
                        )),
                    MyFadeTransition(
                        myAnimationController: widget.animationController!,
                        myAnimation: myAnimation(widget.animationController!, 3),
                        child: const AllFriends()),
                    MyFadeTransition(
                      myAnimationController: widget.animationController!,
                      myAnimation: myAnimation(widget.animationController!, 3),
                      child: const ChatGroup(),
                    ),
                    MyFadeTransition(
                        myAnimationController: widget.animationController!,
                        myAnimation: myAnimation(widget.animationController!, 3),
                        child: const SpecialPerson()),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
