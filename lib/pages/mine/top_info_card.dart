import 'dart:typed_data';

import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/request/post.dart';
import 'package:myapp/response/response.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/read_file.dart';

import 'bottom_sheet.dart';

class TopInfoCard extends StatefulWidget {
  const TopInfoCard({Key? key}) : super(key: key);

  @override
  _TopInfoCardState createState() => _TopInfoCardState();
}

class _TopInfoCardState extends State<TopInfoCard> {
  Logger logger = Logger();
  Uint8List? imageData;
  final colorizeColors = [
    HexColor('#FA6C37'),
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  void _pickImage(int choice) async {
    if (choice == 0) return;
    final ImagePicker _picker = ImagePicker();
    XFile? image;
    switch (choice) {
      case 1:
        image = await _picker.pickImage(source: ImageSource.gallery);
        break;
      case 2:
        image = await _picker.pickImage(source: ImageSource.camera);
        break;
    }
    if (image != null) {
      imageData = await image.readAsBytes();
      var response = await uploadFile(image);
      final res = NestRes<String>.fromJson(response.data);
      setState(() {});
      BotToast.showText(
          text: res.description,
          contentColor: const Color.fromRGBO(245, 62, 62, 1),
          textStyle: const TextStyle(color: Colors.white));
    }
  }

  void _pickChoice() async {
    Get.bottomSheet(choiceSheet(_pickImage));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
              HexColor('#6069D7'),
              HexColor('#7F7FDA'),
              HexColor('#8289E8'),
              HexColor('#898FE1'),
            ]),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 30, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning,',
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#E6E8ED')),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'Larry Page',
                        textStyle: const TextStyle(
                            fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold),
                        colors: colorizeColors,
                      ),
                      ColorizeAnimatedText(
                        'Bill Gates',
                        textStyle: const TextStyle(
                            fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold),
                        colors: colorizeColors,
                      ),
                      ColorizeAnimatedText(
                        'Steve Jobs',
                        textStyle: const TextStyle(
                            fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold),
                        colors: colorizeColors,
                      ),
                    ],
                    isRepeatingAnimation: true,
                    totalRepeatCount: 100,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                  // Text('Christam',
                  //     style: TextStyle(
                  //         fontSize: 20,
                  //         letterSpacing: 1,
                  //         fontWeight: FontWeight.bold,
                  //         color: HexColor('#FB9069'))),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeInLeft(
                    child: Container(
                      width: 200,
                      height: 50,
                      margin: const EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('发布',
                                  style: TextStyle(
                                      fontSize: 18, letterSpacing: 1, color: HexColor('#FFFFFF'))),
                              Text('15',
                                  style: TextStyle(
                                      fontSize: 18,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#FFFFFF'))),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('点赞',
                                  style: TextStyle(
                                      fontSize: 18, letterSpacing: 1, color: HexColor('#FFFFFF'))),
                              Text('6666',
                                  style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#FFFFFF'))),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('关注',
                                  style: TextStyle(
                                      fontSize: 18, letterSpacing: 1, color: HexColor('#FFFFFF'))),
                              Text('89',
                                  style: TextStyle(
                                      fontSize: 18,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#FFFFFF'))),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: _pickChoice,
              child: Container(
                width: 115,
                height: 130,
                margin: const EdgeInsets.only(right: 10),
                child: Stack(children: [
                  RadiusImage(
                    image: MemoryImage(imageData ?? loadIcon()),
                    widthAndHeight: 80,
                    radius: 40,
                    boxShadow: [
                      BoxShadow(
                          color: HexColor('#6057D2'), blurRadius: 20, offset: const Offset(0, 15))
                    ],
                  ),
                  Positioned(
                      left: 40,
                      bottom: 8,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ))
                ]),
              ),
            ),
          ],
        ));
  }
}
