import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:myapp/components/list_tile.dart';
import 'package:myapp/components/rive_loading.dart';
import 'package:myapp/components/swiper_action.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessageListView extends StatefulWidget {
  const MessageListView({Key? key}) : super(key: key);

  @override
  _MessageListViewState createState() => _MessageListViewState();
}

class _MessageListViewState extends State<MessageListView> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, bottom: 65, right: 10),
      padding: EdgeInsets.zero,
      child: AnimationLimiter(
          child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: CustomHeader(
          refreshStyle: RefreshStyle.Behind,
          builder: (BuildContext context, RefreshStatus? mode) {
            return const RiveLoading();
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return Material(
                color: Colors.white,
                child: Ink(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/chat');
                    },
                    splashColor: HexColor('#653CB3'),
                    child: AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: SwiperAction(
                                valueKey: ValueKey(index),
                                child: UserTile(
                                  image: const NetworkImage(
                                    'http://47.103.211.10:9090/static/images/avatar.png',
                                  ),
                                  title: Text('sky',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: HexColor('#653CB3'),
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.5)),
                                  subText: Text('今天真的好开心!',
                                      style: TextStyle(fontSize: 13, color: HexColor('#8C9EE9')),
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ))),
                  ),
                ),
              );
            }),
      )),
    );
  }
}