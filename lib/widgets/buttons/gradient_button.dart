import 'package:flutter/material.dart';
import 'package:nft/constants/gradients.dart';

class GradientButton extends StatefulWidget {
  final String text;
  final Function onTap;
  const GradientButton({Key key, @required this.text, @required this.onTap})
      : super(key: key);

  @override
  _GradientButtonState createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 10, left: 50, right: 50),
        decoration: BoxDecoration(
          // color: theme.focusColor,
          gradient: AppGradients().appGradient,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
