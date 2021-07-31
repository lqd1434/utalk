import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:rive/rive.dart';

class MyRive extends StatefulWidget {
  const MyRive({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyRiveStatePage();
}

class _MyRiveStatePage extends State<MyRive> {
  final String url = 'http://47.103.211.10:9090/static/rive/teddy_login_screen.riv';
  Artboard? _riveArtBoard;
  RiveAnimationController? _controller;

  bool get isPlaying => _controller!.isActive ? true : false;
  final StateMachine _stateMachine = StateMachine();

  @override
  void initState() {
    super.initState();
    // rootBundle.load(url).then((value) async {
    //   final file = RiveFile.network(value);
    //   final artBoard = file.mainArtboard;
    //   artBoard.addController(_controller = SimpleAnimation('idle'));
    //   setState(() => _riveArtBoard = artBoard);
    // });
  }

  @override
  Widget build(BuildContext context) {
    print(_controller!.isActive);
    return Scaffold(
      extendBody: true,
      body: Container(
        color: Colors.deepPurple,
        child: Rive(
          artboard: _riveArtBoard!,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        foregroundColor: Colors.deepPurple,
        child: const Icon(Icons.star, color: Colors.deepPurple, size: 20),
        spaceBetweenChildren: 6,
        buttonSize: 45,
        childrenButtonSize: 50,
        childMargin: EdgeInsets.zero,
        spacing: 2,
        backgroundColor: Colors.white,
        direction: SpeedDialDirection.Up,
        renderOverlay: false,
        elevation: 3,
        children: [
          SpeedDialChild(
              label: '添加',
              child: const Icon(Icons.add, color: Colors.deepPurple, size: 14),
              backgroundColor: Colors.white,
              onTap: () {
                setState(() {
                  _stateMachine.name = 'fail';
                  _riveArtBoard!.addController(_controller = StateMachineController(_stateMachine));
                });
              }),
          SpeedDialChild(
            label: '样式',
            child: const Icon(Icons.add, color: Colors.deepPurple, size: 20),
            backgroundColor: Colors.white,
            onTap: () {
              setState(() {
                _riveArtBoard!.addController(_controller = SimpleAnimation('fail', mix: 1));
              });
            },
          ),
          SpeedDialChild(
              label: '切换',
              child: const Icon(Icons.add, color: Colors.deepPurple, size: 20),
              backgroundColor: Colors.white,
              onTap: () {
                setState(
                  () {
                    setState(() => _controller!.isActive = !_controller!.isActive);
                  },
                );
              })
        ],
      ),
    );
  }
}
