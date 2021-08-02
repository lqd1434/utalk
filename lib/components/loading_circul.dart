import 'package:flutter/material.dart';

class LoadingRound extends StatelessWidget {
  const LoadingRound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: const SizedBox(
          width: 24.0,
          height: 24.0,
          child: CircularProgressIndicator(strokeWidth: 3.0, color: Colors.deepPurpleAccent)),
    );
  }
}
