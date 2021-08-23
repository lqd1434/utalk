import 'package:flutter/material.dart';
import 'package:myapp/utils/hex_color.dart';

class UserNameRow extends StatelessWidget {
  const UserNameRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, top: 20, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning,',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#ACB3C1')),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('Christam',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#5D5D5D'))),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 5),
                Icon(
                  Icons.thumb_up_alt,
                  color: HexColor('#ACB3C1'),
                  size: 28,
                ),
                const SizedBox(height: 5),
                Text(
                  '77789',
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                      color: HexColor('#9794ED')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
