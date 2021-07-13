
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import 'components.dart';

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FriendsStatePage();
}

class FriendsStatePage extends State<Friends> with SingleTickerProviderStateMixin{

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {FocusScope.of(context).requestFocus(FocusNode());},
        child:Container(
            child:Column(
              children: [
                const Search(),
                BottomNavyBar(
                  backgroundColor: const Color.fromRGBO(233, 245, 254, 1),
                  selectedIndex: _currentIndex,
                  onItemSelected: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                    _pageController.jumpToPage(index);
                  },
                  items: <BottomNavyBarItem>[
                    BottomNavyBarItem(
                        title: const Text('在线'), icon: const Icon(Icons.lightbulb),
                        activeColor: const Color.fromRGBO(0, 204, 102, 1),
                    ),
                    BottomNavyBarItem(
                        activeColor: const Color.fromRGBO(128, 0, 255, 1),
                        title: const Text('好友'),
                        icon: const Icon(Icons.people)),
                    BottomNavyBarItem(
                        activeColor: const Color.fromRGBO(0, 204, 204, 1),
                        title: const Text('群组'), icon: const Icon(Icons.chair)),
                    BottomNavyBarItem(
                        activeColor: const Color.fromRGBO(255, 102, 102, 1),
                        title: const Text('特别关心'), icon: const Icon(Icons.favorite)),
                  ],
                ),
                Flexible(
                  child: PageView(
                    controller: _pageController,
                    // physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() => _currentIndex = index);
                    },
                    children:const <Widget>[
                       OnlineFriends(),
                       AllFriends(),
                       ChatGroup(),
                       SpecialPerson(),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
