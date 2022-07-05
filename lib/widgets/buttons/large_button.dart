import 'package:flutter/material.dart';

class LargeButton extends StatefulWidget {
  final String text;
  final Function onTap;
  const LargeButton({Key key, @required this.text, @required this.onTap})
      : super(key: key);

  @override
  _LargeButtonState createState() => _LargeButtonState();
}

class _LargeButtonState extends State<LargeButton> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 55,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 10, left: 35, right: 35),
        decoration: BoxDecoration(
          color: theme.focusColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 20,
            color: theme.textTheme.headline2.color,
          ),
        ),
      ),
    );
  }
}
