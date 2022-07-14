import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft/helpers/text_fade.dart';
import 'package:nft/models/nfts_model.dart';
import 'package:nft/widgets/reusables/profile_image_viewer.dart';
import 'package:timeago/timeago.dart' as timeago;

class NftCard extends StatefulWidget {
  final NftToken feed;
  const NftCard({Key key, this.feed}) : super(key: key);

  @override
  _NftCardState createState() => _NftCardState();
}

class _NftCardState extends State<NftCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   FadeRoute(
        //     page: FeedDetailsPage(
        //       feed: widget.feed,
        //     ),
        //   ),
        // );
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, left: 5, right: 5),
        decoration: new BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.textTheme.headline1.color,
              width: 0.5,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ProfileImageViewer(
                      url: widget.feed.userId.imageUrl,
                      radius: 50,
                      onPressed: () {},
                      alt: widget.feed.userId.email,
                    ),
                    Container(
                      height: 55,
                      margin: EdgeInsets.only(left: 10),
                      width: size.width / 1.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: Text(
                                      widget.feed.userId.firstName,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: theme
                                            .textTheme.headline1.fontFamily,
                                        color: theme.textTheme.headline1.color,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      timeago.format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                            widget.feed.createdAt
                                                .millisecondsSinceEpoch,
                                          ),
                                          locale: 'en_short'),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: theme
                                            .textTheme.headline1.fontFamily,
                                        color: theme.textTheme.bodyText1.color,
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.more_horiz_sharp,
                                  size: 25,
                                  color: theme.textTheme.headline1.color,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            widget.feed.title,
                            textScaleFactor: 1.0,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: theme.textTheme.headline1.fontFamily,
                              color: theme.textTheme.headline1.color,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Hero(
                  tag: "feed_main" + widget.feed.id,
                  child: Container(
                    margin: EdgeInsets.only(top: 3, left: 5, right: 5),
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight:
                            MediaQuery.of(this.context).size.height / 1.75,
                      ),
                      width: MediaQuery.of(this.context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          alignment: Alignment.center,
                          errorWidget: (context, url, error) => Container(
                            height: size.height / 3,
                            width: size.width,
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              size: 40,
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            height: size.height / 2.5,
                            child: CupertinoActivityIndicator(),
                          ),
                          imageUrl: widget.feed.attachments[0].url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10, bottom: 5, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                  CupertinoIcons.heart,
                                  color: theme.primaryColor,
                                ),
                              ),
                            ),
                            CrossFade<String>(
                              initialData: '0',
                              data: widget.feed.likes.toString(),
                              builder: (value) => Text(
                                value,
                                style: TextStyle(
                                    fontFamily:
                                        theme.textTheme.headline1.fontFamily,
                                    color: theme.textTheme.headline1.color,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12.5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: Container(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    CupertinoIcons.chat_bubble,
                                    color: theme.textTheme.headline1.color,
                                  )),
                            ),
                            CrossFade<String>(
                              initialData: '0',
                              data: widget.feed.comments.toString(),
                              builder: (value) => Text(
                                value,
                                style: TextStyle(
                                  fontFamily:
                                      theme.textTheme.headline1.fontFamily,
                                  color: theme.textTheme.headline1.color,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.share_rounded,
                                color: theme.textTheme.headline1.color,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.15,
                    color: theme.textTheme.headline1.color,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
