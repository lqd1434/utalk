import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/utils/hex_color.dart';

import 'header.dart';
import 'info_card.dart';
import 'line_item.dart';
import 'name_row.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 0, end: 1.0)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
            opacity: _animation,
            child: Transform(
                transform: Matrix4.translationValues(0, 60 * (1.0 - _animation.value), 0),
                child: child));
      },
      child: Scaffold(
        extendBody: true,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: const [0.4, 0.3],
                  colors: [HexColor('#EEF3FB'), HexColor('#F2F7FB')])),
          child: ListView(
            children: const [
              Header(),
              UserNameRow(),
              InfoCard(),
              LineItem(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
