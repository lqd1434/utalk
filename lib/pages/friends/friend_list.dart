import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myapp/components/list_tile.dart';
import 'package:myapp/components/rive_loading.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FriendList<T> extends StatefulWidget {
  final T? items;

  const FriendList({Key? key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FriendListStatePage();
}

class FriendListStatePage extends State<FriendList> {
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
        padding: const EdgeInsets.all(0),
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
            itemCount: 30,
            padding: const EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
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
                      ))));
            },
          ),
        )));
  }
}
