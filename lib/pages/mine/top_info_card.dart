import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/read_file.dart';

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
    imageData = await image?.readAsBytes();
    setState(() {});
    logger.w(image);
  }

  void _pickChoice() async {
    int? choice = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
              title: const Text(
                "提示",
                style: TextStyle(color: Colors.blueGrey, fontSize: 18),
              ),
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 1);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.collections,
                        size: 20,
                        color: Colors.deepPurpleAccent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '从相册中选择',
                        style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 2);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.photo_camera,
                        size: 20,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '使用相机拍照',
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      ),
                    ],
                  ),
                )
              ]);
        });
    _pickImage(choice ?? 0);
    logger.i(choice);
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
