import 'package:flutter/material.dart';

class LeftLineIcon extends StatelessWidget {
  const LeftLineIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Icon(
                Icons.drive_file_rename_outline,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 1,
              height: 100,
              color: Colors.grey,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Icon(
                Icons.star_outline,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 1,
              height: 150,
              color: Colors.grey,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Icon(
                Icons.crop_original,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
