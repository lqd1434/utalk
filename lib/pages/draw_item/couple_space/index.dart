import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:myapp/utils/hex_color.dart';

class CoupleSpace extends StatefulWidget {
  const CoupleSpace({Key? key}) : super(key: key);

  @override
  _CoupleSpaceState createState() => _CoupleSpaceState();
}

class _CoupleSpaceState extends State<CoupleSpace> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    Logger logger = Logger();
    logger.i('dispose');
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [HexColor('#FDD3DC'), HexColor('#FEE4E9'), HexColor("#FEF2F4")])),
        child: Column(
          children: [
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 60,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.only(left: 20),
                        decoration:
                            BoxDecoration(color: HexColor('#F87290'), shape: BoxShape.circle),
                        child: const Icon(
                          Icons.chevron_left,
                          size: 36,
                          color: Colors.white,
                        )),
                    // Text('情侣空间',
                    //     style: TextStyle(color: Colors.white, fontSize: 21)),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
