import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/components/back_btn.dart';
import 'package:myapp/components/infinite_list.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/pages/social_space/space_shimmer.dart';
import 'package:myapp/utils/hex_color.dart';

import 'components.dart';

class SocialSpace extends StatefulWidget {
  const SocialSpace({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SocialSpaceStatePage();
}

class _SocialSpaceStatePage extends State<SocialSpace> {
  final _scrollController = ScrollController();
  final Logger logger = Logger();
  final GetxState getX = Get.find();
  bool _isShowTitle = false;
  final List<ItemType> _items = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset == 0.0 && _isShowTitle == true) {
        setState(() {
          _isShowTitle = false;
        });
      } else if (_scrollController.offset >= 160.0 && _isShowTitle == false) {
        setState(() {
          _isShowTitle = true;
        });
      }
    });
    _fetchPage(_items.length, 2);
  }

  Future<void> _fetchPage(int pageKey, int limit) async {
    Future.delayed(const Duration(seconds: 2)).then((e) {
      _items.insertAll(_items.length, getItem(_items.length, 5));
      setState(() {
        //重新构建列表
      });
    });
  }

  List<ItemType> getItem(int pageKey, int pageSize) {
    List<ItemType> items = [];
    for (int i = 0; i < pageSize; i++) {
      items.add(ItemType(pageKey + i, 'hello-$i'));
    }
    return items;
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#D6D1EC'),
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  expandedHeight: 210.0,
                  pinned: true,
                  leading: const BackBtn(
                    path: '/home',
                  ),
                  actions: [
                    Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: IconButton(
                          icon: const Icon(Icons.notifications),
                          onPressed: () {
                            Get.toNamed('');
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add_circle_outline,
                            size: 26,
                          ),
                          onPressed: () {
                            Get.toNamed('');
                          },
                        ))
                  ],
                  flexibleSpace:
                      getFlexibleSpaceBar(_isShowTitle, MediaQuery.of(context).padding.top))
            ];
          },
          body: _items.isEmpty
              ? const RepaintBoundary(child: SpaceShimmer())
              : InfiniteList(
                  itemLength: _items.length,
                  maxSize: 20,
                  fetchData: _fetchPage,
                  listViewFunc: (BuildContext context, int index) {
                    return const RepaintBoundary(child: MoodTell());
                  },
                )),
    );
  }
}

Widget getFlexibleSpaceBar(bool isShowTitle, double paddingTop) {
  return FlexibleSpaceBar(
      centerTitle: true,
      title: isShowTitle ? const Text('好友动态', style: TextStyle(fontSize: 18)) : null,
      background: Container(
        child: Image.network(
          'http://47.103.211.10:9090/static/images/pexels-eberhard-grossgasteiger-1287145.jpg',
          fit: BoxFit.cover,
          height: 200.0,
        ),
      ));
}

class ItemType {
  late int key;
  late String data;

  ItemType(this.key, this.data);

  @override
  String toString() {
    return '$key---$data';
  }
}
