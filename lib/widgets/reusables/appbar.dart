import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  const MyAppBar({Key key, @required this.title, @required this.actions})
      : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FadeInLeft(
                  delay: const Duration(milliseconds: 200),
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: 40,
                    margin: EdgeInsets.only(left: 10),
                    child: RawMaterialButton(
                      elevation: 0,
                      fillColor: theme.cardColor,
                      shape: CircleBorder(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          CupertinoIcons.back,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ),
                FadeInRight(
                  delay: const Duration(milliseconds: 200),
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment.center,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeInRight(
            delay: const Duration(milliseconds: 200),
            duration: const Duration(milliseconds: 300),
            child: Container(
              height: 40,
              margin: EdgeInsets.only(right: 10),
              child: Row(
                children: widget.actions,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
