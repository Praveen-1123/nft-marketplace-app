import 'package:flutter/material.dart';

class MyAssetImage extends StatefulWidget {
  final String path;
  final BoxFit fit;
  final double radius;
  final double height;
  final double width;
  const MyAssetImage(
      {Key key,
      @required this.path,
      @required this.fit,
      @required this.radius,
      this.height,
      this.width})
      : super(key: key);
  @override
  _MyAssetImageState createState() => _MyAssetImageState();
}

class _MyAssetImageState extends State<MyAssetImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height != null ? widget.height : null,
      width: widget.width != null ? widget.width : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius),
        child: Image.asset(
          widget.path,
          fit: widget.fit,
        ),
      ),
    );
  }
}
