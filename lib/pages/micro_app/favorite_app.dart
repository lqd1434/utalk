import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'components.dart';

class FavoriteApp extends StatefulWidget {
  const FavoriteApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FavoriteAppStatePage();
}

class FavoriteAppStatePage extends State<FavoriteApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          margin: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('最受欢迎',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 0, 0, 0.6))),
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Details', style: TextStyle(fontSize: 18, color: Colors.deepPurple)),
                    SizedBox(width: 8),
                    Icon(Icons.east, size: 26, color: Colors.deepPurple)
                  ],
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          child: Container(
            height: 240,
            margin: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(62),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                boxShadow: [BoxShadow(color: Color.fromRGBO(140, 161, 235, 1), blurRadius: 5)]),
            child: Column(
              children: [
                Container(
                  height: 170,
                  child: Row(children: [
                    Container(
                      width: 130,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: const [
                          LeftBorderText(
                            subtitle: '名称',
                            title: '风铃音乐',
                            subtitleColor: Colors.grey,
                            titleColor: Colors.blue,
                            barColor: Color.fromRGBO(135, 160, 229, 0.5),
                          ),
                          LeftBorderText(
                            subtitle: '喜欢',
                            title: '1949',
                            subtitleColor: Colors.grey,
                            titleColor: Colors.deepPurpleAccent,
                            barColor: Color.fromRGBO(245, 110, 152, 0.5),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(19, 18, 0, 10),
                      child: SleekCircularSlider(
                        appearance: CircularSliderAppearance(
                            angleRange: 360,
                            startAngle: 270,
                            customColors: CustomSliderColors(
                                dynamicGradient: true,
                                trackColor: const Color.fromRGBO(191, 199, 231, 1),
                                progressBarColors: [
                                  const Color.fromRGBO(108, 141, 231, 1),
                                  const Color.fromRGBO(106, 110, 215, 1),
                                  const Color.fromRGBO(97, 80, 225, 1),
                                  const Color.fromRGBO(66, 75, 211, 1),
                                ])),
                        min: 0,
                        max: 1000,
                        initialValue: 600,
                        onChange: (double value) {},
                        innerWidget: (double value) {
                          return Container(
                              margin: const EdgeInsets.only(top: 52),
                              alignment: Alignment.center,
                              child: Column(
                                children: const [
                                  Text('1598',
                                      style: TextStyle(
                                          color: Colors.deepPurpleAccent,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500)),
                                  Text('喜欢',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500))
                                ],
                              ));
                          // use your custom widget inside the slider (gets a slider value from the callback)
                        },
                      ),
                    )
                  ]),
                ),
                const Divider(color: Colors.deepPurple),
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      PercentData(
                        percent: 0.7,
                        title: '满意度',
                        progressBarColor: Color.fromRGBO(106, 110, 215, 0.7),
                        backgroundColor: Color.fromRGBO(191, 199, 231, 0.6),
                      ),
                      PercentData(
                        percent: 0.5,
                        title: '产品',
                        progressBarColor: Color.fromRGBO(253, 110, 138, 0.6),
                        backgroundColor: Color.fromRGBO(252, 213, 220, 0.6),
                      ),
                      PercentData(
                        percent: 0.8,
                        title: '服务',
                        progressBarColor: Color.fromRGBO(13, 242, 203, 0.6),
                        backgroundColor: Color.fromRGBO(209, 250, 243, 0.6),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
