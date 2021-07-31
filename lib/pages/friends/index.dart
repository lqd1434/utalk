import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/components/my_animation.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/pages/home/HomePage.dart';

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
                      rippleColor: Colors.deepPurple,
                      color: Colors.deepPurple,
                      tabBackgroundColor: Colors.deepPurple,
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
                        GButton(text: '在线', icon: Icons.sms),
                        GButton(text: '好友', icon: Icons.people),
                        GButton(text: '群组', icon: Icons.camera),
                        GButton(text: '特别关心', icon: Icons.favorite)
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
                        myAnimation: myAnimation(widget.animationController!, 2),
                        child: OnlineModelList(
                          animationController: widget.animationController,
                        )),
                    MyFadeTransition(
                        myAnimationController: widget.animationController!,
                        myAnimation: myAnimation(widget.animationController!, 2),
                        child: const AllFriends()),
                    MyFadeTransition(
                      myAnimationController: widget.animationController!,
                      myAnimation: myAnimation(widget.animationController!, 2),
                      child: const ChatGroup(),
                    ),
                    MyFadeTransition(
                        myAnimationController: widget.animationController!,
                        myAnimation: myAnimation(widget.animationController!, 2),
                        child: const SpecialPerson()),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
