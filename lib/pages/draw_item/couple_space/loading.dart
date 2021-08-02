import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final String url = 'static/flare/document_icon.riv';
  late Artboard _riveArtBoard;
  RiveAnimationController? _controller;

  @override
  void initState() {
    // _riveArtBoard.addController(controller!);
    // _bump = controller.findInput<bool>('bump') as SMITrigger;
    rootBundle.load(url).then((value) async {
      final file = RiveFile.import(value);
      final artBoard = file.mainArtboard;
      artBoard.addController(_controller = SimpleAnimation('idle'));
      setState(() => _riveArtBoard = artBoard);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            final controller = StateMachineController.fromArtboard(_riveArtBoard, 'bumpy');
            // _riveArtBoard.addController(controller = S('fail', mix: 1));
          });
        },
        child: Rive(
          artboard: _riveArtBoard,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
