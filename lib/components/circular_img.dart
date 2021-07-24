
import 'package:flutter/cupertino.dart';

class RadiusImage extends StatefulWidget {
  final double? radius;
  final double? widthAndHeight;
  final ImageProvider image;
  final BoxBorder? border;

  const RadiusImage({
    Key? key,
    this.radius = 25,
    this.widthAndHeight = 50,
    required this.image,
    this.border,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => RadiusImageStatePage();
}

class RadiusImageStatePage extends State<RadiusImage>{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.widthAndHeight,
        height: widget.widthAndHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius!),
            border: widget.border,
            image: DecorationImage(
              image: widget.image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

}