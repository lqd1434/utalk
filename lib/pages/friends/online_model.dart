import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:logger/logger.dart';
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

  @override
  void initState() {
    load();
    super.initState();
  }

  void _onRefresh() async {
    Logger().i('_onRefresh');
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.headerMode!.value = RefreshStatus.completed;
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

  Widget loadText(IconData icon, String text, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        Text(
          text,
          style: TextStyle(color: color, fontSize: 18),
        )
      ],
    );
  }

  Widget loadBuilder(BuildContext context, RefreshStatus? mode) {
    if (mode == RefreshStatus.refreshing) {
      return const RiveLoading();
    } else {
      Widget body;
      if (mode == RefreshStatus.failed) {
        body = loadText(Icons.error, '加载失败', Colors.red);
      } else if (mode == RefreshStatus.completed) {
        body = loadText(Icons.check_circle, '刷新成功', Colors.green);
      } else if (mode == RefreshStatus.idle) {
        body = loadText(Icons.vertical_align_bottom, '下拉刷新', Colors.blue);
      } else {
        body = loadText(Icons.vertical_align_top, '释放刷新', Colors.grey);
      }
      return Container(height: 100, alignment: Alignment.center, child: body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(241, 242, 249, 1),
        padding: const EdgeInsets.only(bottom: 80),
        child: AnimationLimiter(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            header: CustomHeader(refreshStyle: RefreshStyle.Behind, builder: loadBuilder),
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: GridView.builder(
              padding: const EdgeInsets.only(top: 5),
              itemCount: 10,
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
                        borderRadius: BorderRadius.circular(10), color: HexColor('#7F7FDA')),
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
                          ? Icon(Icons.thumb_up_alt, color: HexColor('#7F7FDA'), size: 26)
                          : Icon(
                              Icons.thumb_up_off_alt,
                              size: 26,
                              color: HexColor('#7F7FDA'),
                            ),
                    ))
              ],
            )
          ],
        ));
  }
}
