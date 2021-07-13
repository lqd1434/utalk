import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:video_player/video_player.dart';


// try {
//     var response = await Dio().get(
//         'https://my-music-api.vercel.app/mv/url?id=5436712',
//     );
//     Map<String,dynamic> res = response.data;
//     var logger = Logger();
//     logger.i(res);
//     final String musicUrl=res['data']['url'];
//     print(musicUrl);
//     // final player = AudioPlayer();
//     // var duration = await player.setUrl(musicUrl);
//     // print(duration);
//     // player.play();
//     _controller = VideoPlayerController.network(musicUrl);
//
//     _controller!.addListener(() {
//       setState(() {});
//     });
//     _controller!.setLooping(true);
//     _controller!.initialize().then((_) => setState(() {}));
//     _controller!.play();
// } catch (e) {
//       print(e);
//     }
class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}



class _VideoAppState extends State<VideoApp> {
  VideoPlayerController? _controller;
  String? musicUrl;

  @override
  void initState() {
    super.initState();
    getMusicUrl();
  }

  getMusicUrl() async {
    var response = await Dio().get(
      'https://my-music-api.vercel.app/mv/url?id=5341369&r=1080',
    );
    Map<String, dynamic> res = response.data;
    var logger = Logger();
    logger.i(res);
    final String url = res['data']['url'];
    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {});
      });
    logger.i(_controller!.value.aspectRatio);
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null) {
      return Scaffold(
          body: Center(
            child: _controller!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  )
                : Container(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _controller!.value.isPlaying
                    ? _controller!.pause()
                    : _controller!.play();
              });
            },
            child: Icon(
              _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
