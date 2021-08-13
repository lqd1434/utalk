import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myapp/components/rive_loading.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OnlineModelList extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const OnlineModelList({Key? key, this.animationController, this.animation}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OnlineModelListStatePage();
}

class _OnlineModelListStatePage extends State<OnlineModelList> {
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

  int count = 0;

  void load() async {
    int c = await compute(delay, 1);
    setState(() {
      count = c;
    });
  }

  static Future<int> delay(int i) async {
    await Future.delayed(const Duration(seconds: 1));
    return 10;
  }

  @override
  void initState() {
    load();
    super.initState();

    // if (mounted) {
    //   print(_key.currentContext!.size);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(241, 242, 249, 1),
        padding: const EdgeInsets.only(bottom: 70),
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
            child: count == 0
                ? const RiveLoading()
                : GridView.builder(
                    padding: const EdgeInsets.only(top: 5),
                    itemCount: count,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 2.6,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        columnCount: 2,
                        child: const ScaleAnimation(
                          child: FadeInAnimation(
                            child: OnlineModel(),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ));
  }
}

class OnlineModel extends StatefulWidget {
  const OnlineModel({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OnlineModelStatePage();
}

class _OnlineModelStatePage extends State<OnlineModel> {
  bool _isApprove = false;

  void _approve() {
    setState(() {
      _isApprove = !_isApprove;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(color: HexColor('#8CA1EB'), blurRadius: 5),
        ]),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.male, color: Colors.blue),
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Colors.deepPurple),
                    child: const Text(
                      'Jack',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Image.network(
                'http://47.103.211.10:9090/static/images/suitMan.png',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 6),
                    child: GestureDetector(
                      onTap: _approve,
                      child: _isApprove
                          ? const Icon(Icons.thumb_up_alt, color: Colors.deepPurple, size: 26)
                          : const Icon(Icons.thumb_up_off_alt, size: 26),
                    ))
              ],
            )
          ],
        ));
  }
}
