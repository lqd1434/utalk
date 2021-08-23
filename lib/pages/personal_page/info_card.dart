import 'package:flutter/material.dart';
import 'package:myapp/utils/hex_color.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 36, top: 40),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          gradient:
              LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
            HexColor('#7A71C4'),
            HexColor('#8287E5'),
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(left: 20, right: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, color: HexColor('#726CBC')),
            child: const Icon(Icons.face, color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '男  |  ♑摩羯座  |  江西省南昌市',
                style: TextStyle(fontSize: 16, color: HexColor('#6769B4')),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '个人信息 ',
                    style: TextStyle(fontSize: 17, color: HexColor('#EDF3FC')),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: HexColor('#EDF3FC'),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
