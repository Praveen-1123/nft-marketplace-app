import 'package:nft/constants/gradients.dart';
import 'package:nft/helpers/text_fade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FlexibleButton extends StatefulWidget {
  final bool isLoading;
  final String text;
  final EdgeInsetsGeometry margin;
  final double width;
  final Function onPressed;

  const FlexibleButton({
    Key key,
    @required this.isLoading,
    @required this.text,
    @required this.onPressed,
    this.margin,
    this.width,
  }) : super(key: key);

  @override
  _FlexibleButtonState createState() => _FlexibleButtonState();
}

class _FlexibleButtonState extends State<FlexibleButton> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      height: 50,
      margin: widget.margin != null ? widget.margin : null,
      width: widget.width != null ? widget.width : null,
      decoration: BoxDecoration(
        gradient: AppGradients().appGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: widget.isLoading ? null : widget.onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
            (states) => theme.cardColor.withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: widget.isLoading
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.center,
          children: [
            CrossFade<String>(
              initialData: '',
              data: widget.text,
              builder: (value) => Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            widget.isLoading
                ? SpinKitSpinningLines(
                    size: 25,
                    color: theme.scaffoldBackgroundColor,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
