
import 'package:flutter/cupertino.dart';

class RadiusImage extends StatefulWidget{
  final double radius;
  final double widthAndHeight;
  final ImageProvider image;
  const RadiusImage({Key? key, required this.radius, required this.widthAndHeight, required this.image,}):super(key: key);

  @override
  State<StatefulWidget> createState()=>RadiusImageStatePage();
}

class RadiusImageStatePage extends State<RadiusImage>{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.widthAndHeight,
        height: widget.widthAndHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            image: DecorationImage(
              image: widget.image,
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }

}