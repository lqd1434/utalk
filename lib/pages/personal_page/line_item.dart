import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/utils/hex_color.dart';

import 'left_line_icon.dart';

class LineItem extends StatelessWidget {
  const LineItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      padding: const EdgeInsets.only(left: 40, top: 40),
      child: Stack(
        children: [
          const LeftLineIcon(),
          Positioned(
            left: 10,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(left: 60),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 5))
                        ]),
                    child: Stack(
                      children: [
                        Positioned(
                          left: -20,
                          child: Icon(
                            Icons.mood,
                            size: 100,
                            color: HexColor('#F5F8FA'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '个性签名',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '这一次我终究还是来得太迟...',
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/space');
                    },
                    child: Container(
                      height: 100,
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(left: 60, top: 50),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                HexColor('#7A71C4'),
                                HexColor('#8287E5'),
                              ]),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 5))
                          ]),
                      child: Stack(
                        children: [
                          Positioned(
                            left: -20,
                            child: Icon(
                              Icons.star_outline,
                              size: 100,
                              color: HexColor('#726CBC'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '我的空间',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '记录快乐的每一天',
                                  style: TextStyle(fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: 300,
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(left: 60, top: 50),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 5))
                          ]),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/gallery');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                padding: const EdgeInsets.only(top: 10),
                                width: double.maxFinite,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 10,
                                      child: Icon(
                                        Icons.crop_original,
                                        size: 50,
                                        color: HexColor('#F5F8FA'),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 40,
                                      top: 10,
                                      child: Text(
                                        '精美相册',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Positioned(
                                      left: 160,
                                      top: 10,
                                      child: Row(
                                        children: const [
                                          Text(
                                            '更多',
                                            style: TextStyle(fontSize: 18, color: Colors.blue),
                                          ),
                                          Icon(Icons.arrow_forward, color: Colors.blue)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10, left: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 200,
                                      child: const RadiusImage(
                                        widthAndHeight: 160,
                                        radius: 15,
                                        image: NetworkImage(
                                            'http://47.103.211.10:9090/static/images/pexels-adrianna-calvo-364096.jpg'),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
