import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/meet_you/radar.dart';

class RadarPage extends StatelessWidget {
  const RadarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0F1532),
        body: Stack(
          children: [
            Positioned.fill(
              left: 10,
              right: 10,
              child: Center(
                child: Stack(children: [
                  Positioned.fill(
                    child: RadarView(),
                  ),
                  Positioned(
                    child: Center(
                      child: Container(
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'http://47.103.211.10:9090/static/images/avatar.png')),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(.5),
                                blurRadius: 5.0,
                                spreadRadius: 3.0,
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Positioned(
                      height: MediaQuery.of(context).padding.top + 100,
                      left: 10,
                      child: IconButton(
                        onPressed: () {
                          Get.offNamed('/home');
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 35,
                        ),
                      )),
                ]),
              ),
            )
          ],
        ));
  }
}
