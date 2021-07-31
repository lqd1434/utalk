import 'package:flutter/material.dart';

class RadiusImage extends StatelessWidget {
  final double? radius;
  final double? widthAndHeight;
  final ImageProvider image;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  const RadiusImage({
    Key? key,
    this.radius = 25,
    this.widthAndHeight = 50,
    required this.image,
    this.border,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widthAndHeight,
        height: widthAndHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius!),
            border: border,
            boxShadow: boxShadow,
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
