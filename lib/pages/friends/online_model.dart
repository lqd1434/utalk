import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class OnlineModelList extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const OnlineModelList({Key? key, this.animationController, this.animation}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OnlineModelListStatePage();
}

class _OnlineModelListStatePage extends State<OnlineModelList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(230, 234, 255, 1),
      child: AnimationLimiter(
        child: GridView.count(
          childAspectRatio: 2 / 3,
          padding: const EdgeInsets.only(top: 5),
          crossAxisCount: 2,
          children: List.generate(
            100,
            (int index) {
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
      ),
      // GridView.builder(
      //   padding: const EdgeInsets.only(top: 5),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2, childAspectRatio: 2 / 3),
      //   itemCount: 20,
      //   itemBuilder: (BuildContext context, int index) {
      //     return OnlineModel();
      //     )
    );
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
        height: 400,
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.deepPurpleAccent),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Color.fromRGBO(191, 199, 231, 1), blurRadius: 5.0),
              BoxShadow(color: Color.fromRGBO(191, 199, 231, 1), blurRadius: 5.0)
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
            Image.network(
              'http://47.103.211.10:9090/static/images/suitMan.png',
              height: 170,
              fit: BoxFit.cover,
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
