import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

StatusBloc slimyCard = StatusBloc();

class MySlimyCard extends StatefulWidget {
  final Color color;
  final double width;
  final double topCardHeight;
  final double bottomCardHeight;
  final double borderRadius;
  final Widget? topCardWidget;
  final Widget? bottomCardWidget;
  final bool slimeEnabled;
  final List<Color>? threeBgGradient;
  final Color? bgColor;

  const MySlimyCard({
    Key? key,
    this.color = Colors.purple,
    this.width = 300,
    this.topCardHeight = 300,
    this.bottomCardHeight = 150,
    this.borderRadius = 25,
    this.topCardWidget,
    this.bottomCardWidget,
    this.slimeEnabled = true,
    this.threeBgGradient,
    this.bgColor,
  })  : assert(topCardHeight >= 150, 'Height of Top Card must be at least 150.'),
        assert(bottomCardHeight >= 100, 'Height of Bottom Card must be at least 100.'),
        assert(threeBgGradient == null || bgColor == null,
            'bgGradient and bgColor must to user one of them'),
        assert(width >= 100, 'Width must be at least 100.'),
        assert(borderRadius <= 30 && borderRadius >= 0,
            'Border Radius must neither exceed 30 nor be negative'),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _MySlimyCardStatePage();
}

class _MySlimyCardStatePage extends State<MySlimyCard> with TickerProviderStateMixin {
  static const double initialBottomDimension = 100;
  late bool isSeperated;
  late bool isOpen;
  late double bottomDimension;
  late double finalBottomDimension;
  late double gap;
  late double gapInitial;
  late double gapFinal;
  late double x;
  late double y;

  late String activeAnimation;
  late Widget topCardWidget;
  late Widget bottomCardWidget;

  late Animation<double> arrowAnimation;
  late AnimationController arrowAnimController;

  void action() {
    if (isSeperated) {
      isSeperated = false;
      Future.delayed(Duration(milliseconds: 200), () {
        setState(() {
          isOpen = false;
        });
      });
      slimyCard.updateStatus(false);
      arrowAnimController.reverse();
      gap = gapInitial;
      bottomDimension = initialBottomDimension;
    } else {
      isSeperated = true;
      setState(() {
        isOpen = true;
      });
      slimyCard.updateStatus(true);
      arrowAnimController.forward();
      gap = gapFinal;
      bottomDimension = finalBottomDimension;
    }

    activeAnimation = (activeAnimation == 'Idle') ? 'Action' : 'Idle';
  }

  @override
  void initState() {
    super.initState();

    isSeperated = false;
    isOpen = false;
    activeAnimation = 'Idle';
    finalBottomDimension = widget.bottomCardHeight;
    bottomDimension = initialBottomDimension;

    topCardWidget = widget.topCardWidget ?? simpleTextWidget('This is Top Card Widget.');

    bottomCardWidget = widget.bottomCardWidget ?? simpleTextWidget('This is Bottom Card Widget.');

    arrowAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    arrowAnimation = Tween<double>(begin: 0, end: 0.5).animate(arrowAnimController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    x = (widget.borderRadius < 10) ? 10 : widget.borderRadius;
    y = (widget.borderRadius < 2) ? 2 : widget.borderRadius;

    gapInitial = ((widget.topCardHeight - x - widget.width / 4) > 0)
        ? (widget.topCardHeight - x - widget.width / 4)
        : 0;

    gapFinal = ((widget.topCardHeight + x - widget.width / 4 + 50) > 0)
        ? (widget.topCardHeight + x - widget.width / 4 + 50)
        : 2 * x + 50;

    gap = gapInitial;
  }

  @override
  void didUpdateWidget(MySlimyCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      if (widget.topCardWidget != null) {
        topCardWidget = widget.topCardWidget!;
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    print(isSeperated);
    return GestureDetector(
      onTap: () {
        setState(() {
          action();
        });
      },
      child: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Column(
              children: <Widget>[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1800),
                  height: gap,
                  curve: Curves.elasticOut,
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      height: bottomDimension,
                      width: widget.width,
                      decoration: BoxDecoration(
                        color: widget.threeBgGradient == null ? widget.bgColor : null,
                        gradient: widget.bgColor == null
                            ? LinearGradient(
                                colors: widget.threeBgGradient!,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: isOpen ? [0, 0, 1] : [0.3, 0.3, 0.3])
                            : null,
                        borderRadius: BorderRadius.circular(widget.borderRadius),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 100),
                        opacity: (isSeperated) ? 1.0 : 0,
                        child: bottomCardWidget,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: FlareActor(
                            'static/flare/bottomSlime.flr',
                            color: widget.bgColor != null
                                ? widget.bgColor!.withOpacity((widget.slimeEnabled) ? 1 : 0)
                                : widget.threeBgGradient![1],
                            animation: activeAnimation,
                            sizeFromArtboard: true,
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.contain,
                          ),
                          height: widget.width / 4,
                          width: widget.width,
                        ),
                        SizedBox(
                          height: bottomDimension - (x),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: widget.topCardHeight,
                  width: widget.width,
                  decoration: BoxDecoration(
                    color: widget.threeBgGradient == null ? widget.bgColor : null,
                    gradient: widget.bgColor == null
                        ? LinearGradient(
                            colors: widget.threeBgGradient!,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  ),
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(10),
                  child: topCardWidget,
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: ((widget.topCardHeight - y) > 0) ? (widget.topCardHeight - y) : 0,
                    ),
                    Container(
                      height: widget.width / 4,
                      width: widget.width,
                      child: FlareActor(
                        'packages/slimy_card/assets/flare/topSlime.flr',
                        color: widget.bgColor != null
                            ? widget.bgColor!.withOpacity((widget.slimeEnabled) ? 1 : 0)
                            : widget.threeBgGradient![2],
                        animation: activeAnimation,
                        sizeFromArtboard: true,
                        alignment: Alignment.topCenter,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: ((widget.topCardHeight - 2 * 50 / 3) > 0)
                      ? (widget.topCardHeight - 2 * 50 / 3)
                      : 0,
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: RotationTransition(
                    turns: arrowAnimation,
                    child: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: widget.color.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget simpleTextWidget(String text) {
  return Center(
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

class StatusBloc {
  var statusController = StreamController<bool>.broadcast();

  Function(bool) get updateStatus => statusController.sink.add;

  Stream<bool> get stream => statusController.stream;

  dispose() {
    statusController.close();
  }
}
