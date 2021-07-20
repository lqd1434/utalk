
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';

import 'components.dart';

class MoodSpace extends StatefulWidget {
  const MoodSpace({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MoodSpaceStatePage();
}

class MoodSpaceStatePage extends State<MoodSpace> {

  final _scrollController = ScrollController();
  final Logger logger = Logger();
  final GetxState getX = Get.find();
  bool _isShowTitle = false;
  final GetxState gexState = Get.find();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset == 0.0) {
        setState(() {
          _isShowTitle = false;
        });
      } else if(_scrollController.offset >=200.0){
        setState(() {
          _isShowTitle = true;
        });
      }
    });
  }

  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 210.0,
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: _isShowTitle ? const Text('好友动态', style: TextStyle(fontSize: 18)) : null,
                  background: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top),
                      GFCarousel(
                        viewportFraction: 1.0,
                        autoPlay: true,
                        items: imageList.map(
                          (url) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                child: Image.network(url, fit: BoxFit.cover, width: 800.0),
                              ),
                            );
                          },
                        ).toList(),
                        onPageChanged: (index) {
                          setState(() {
                            index;
                          });
                        },
                      ),
                    ],
                  )),
            )
          ];
        },
        body: ListView.builder(
            itemCount: 100,
            padding: const EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index) {
              return const MoodTell();
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
