import 'dart:typed_data';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickChoice,
              child: SizedBox(
                width: 115,
                height: 130,
                child: Stack(children: [
                  RadiusImage(
                    image: MemoryImage(imageData ?? loadIcon()),
                    widthAndHeight: 110,
                    radius: 55,
                  ),
                  Positioned(
                      left: 40,
                      bottom: -5,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: HexColor('#7D62E7'),
                        ),
                      ))
                ]),
              ),
            ),
            const SizedBox(height: 10),
            Text('爱哭的鱼',
                style: TextStyle(
                    color: HexColor('#D5FA65'),
                    fontSize: 25,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500)),
          ],
        ));
  }
}
