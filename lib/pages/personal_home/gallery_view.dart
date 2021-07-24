import 'dart:typed_data';
import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:myapp/utils/hex_color.dart';

class GalleryView extends StatefulWidget {
  final List<Uint8List> images;

  const GalleryView({Key? key, required this.images}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GalleryViewWidgetState();
}

class _GalleryViewWidgetState extends State<GalleryView> {
  double _page = 5;
  final PageController pageController = PageController(initialPage: 5);

  @override
  void initState() {
    super.initState();
    pageController.addListener(
      () {
        setState(
          () {
            _page = pageController.page!;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: HexColor('#805AC8'),
        shadowColor: HexColor('#1A1A1A'),
        title: const Text('个人画廊', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.offNamed("/personalHome");
          },
          child: const Icon(FontAwesomeIcons.chevronLeft, color: Colors.white),
        ),
      ),
      backgroundColor: HexColor('#8465BD'),
      floatingActionButton: getSpeedDial(),
      body: Center(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: SizedBox(
                height: width,
                width: width * 0.95,
                child: LayoutBuilder(
                  builder: (context, boxConstraints) {
                    List<Widget> cards = <Widget>[];
                    for (int i = 0; i <= 6; i++) {
                      double currentPageValue = i - _page;
                      bool pageLocation = currentPageValue > 0;
                      double start = 20 +
                          max(
                              (boxConstraints.maxWidth - width * .75) -
                                  ((boxConstraints.maxWidth - width * .75) / 2) *
                                      -currentPageValue *
                                      (pageLocation ? 9 : 1),
                              0.0);
                      var customizableCard = Positioned.directional(
                        top: 20 + 30 * max(-currentPageValue, 0.0),
                        bottom: 20 + 30 * max(-currentPageValue, 0.0),
                        start: start,
                        textDirection: TextDirection.ltr,
                        child: FadeInLeft(
                          child: Container(
                            height: width * .67,
                            width: width * .67,
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: MemoryImage(
                                      widget.images[i],
                                    )),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(color: Colors.black.withOpacity(.15), blurRadius: 10)
                                ]),
                          ),
                        ),
                      );
                      cards.add(customizableCard);
                    }
                    return Stack(children: cards);
                  },
                ),
              ),
            ),
            Positioned.fill(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: 7,
                controller: pageController,
                itemBuilder: (context, index) {
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getSpeedDial() {
  return SpeedDial(
    icon: FontAwesomeIcons.minus,
    foregroundColor: Colors.deepPurple,
    child: const Icon(FontAwesomeIcons.star, color: Colors.deepPurple, size: 20),
    spaceBetweenChildren: 6,
    buttonSize: 45,
    childrenButtonSize: 50,
    childMargin: EdgeInsets.zero,
    spacing: 2,
    backgroundColor: Colors.white,
    direction: SpeedDialDirection.Up,
    renderOverlay: false,
    elevation: 3,
    children: [
      SpeedDialChild(
        label: '添加',
        child: const Icon(FontAwesomeIcons.plus, color: Colors.deepPurple, size: 14),
        backgroundColor: Colors.white,
      ),
      SpeedDialChild(
        label: '样式',
        child: const Icon(FontAwesomeIcons.diceTwo, color: Colors.deepPurple, size: 20),
        backgroundColor: Colors.white,
        onTap: () => print('SECOND CHILD'),
      ),
    ],
  );
}
