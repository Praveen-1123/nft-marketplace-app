import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class ProfileImageViewer extends StatefulWidget {
  final String url;
  final String alt;
  final double radius;
  final Function onPressed;
  const ProfileImageViewer(
      {Key key,
      @required this.url,
      @required this.radius,
      @required this.onPressed,
      @required this.alt})
      : super(key: key);

  @override
  State<ProfileImageViewer> createState() => _ProfileImageViewerState();
}

class _ProfileImageViewerState extends State<ProfileImageViewer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 3),
        child: Container(
          width: 50,
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.radius),
            child: widget.url == "None"
                ? ProfilePicture(
                    name: widget.alt,
                    radius: widget.radius,
                    fontsize: 20,
                    random: false,
                  )
                : CachedNetworkImage(
                    placeholder: (context, url) => new Center(
                      child: CupertinoActivityIndicator(),
                    ),
                    imageUrl: widget.url,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
