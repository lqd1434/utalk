import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/gradient.dart' as Gra;
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:rive/rive.dart';

class EmptyList extends StatefulWidget {
  final String? des;

  const EmptyList({Key? key, this.des = '啊哦,为什么没有人给我发消息呢'}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmptyListStatePage();
}

class _EmptyListStatePage extends State<EmptyList> {
  final String url = 'http://47.103.211.10:9090/static/rive/teddy_login_screen.riv';

  RiveAnimationController? _controller;

  bool get isPlaying => _controller!.isActive ? true : false;

  Future<dynamic> getRive() async {
    final file = await RiveFile.network(url);
    final artBoard = file.mainArtboard;
    artBoard.addController(_controller = SimpleAnimation('fail'));
    return artBoard;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
                width: 300,
                height: 300,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    gradient: Gra.RadialGradient(colors: [
                  HexColor('#BBEFED'),
                  Colors.white,
                ])),
                child: Stack(children: [
                  Container(
                      width: 250,
                      height: 250,
                      margin: const EdgeInsets.only(left: 20, top: 50),
                      child: FutureBuilder(
                        future: getRive(),
                        builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                          if (asyncSnapshot.connectionState == ConnectionState.done) {
                            if (asyncSnapshot.hasData) {
                              return Rive(
                                artboard: asyncSnapshot.data,
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                              );
                            } else {
                              return const SizedBox();
                            }
                          } else {
                            return const SizedBox();
                          }
                        },
                      )),
                  Positioned(
                    top: 80,
                    right: -20,
                    child: Bubble(
                        shadowColor: HexColor('#BBEFED'),
                        margin: const BubbleEdges.only(top: 10),
                        padding: const BubbleEdges.all(10),
                        alignment: Alignment.centerLeft,
                        color: HexColor('#BBEFED'),
                        nip: BubbleNip.leftBottom,
                        nipRadius: 4,
                        nipWidth: 20,
                        nipHeight: 20,
                        elevation: 1,
                        child: Container(
                          height: 50,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
                          child: Text(widget.des!,
                              style:
                                  GoogleFonts.getFont('ZCOOL QingKe HuangYou', letterSpacing: 1)),
                        )),
                  )
                ])),
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: const Text('怎么是空的', style: TextStyle(fontSize: 20)),
            )
          ],
        ));
  }
}
