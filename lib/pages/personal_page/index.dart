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

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
