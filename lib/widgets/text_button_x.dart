import 'package:flutter/material.dart';

class TextButtonX extends StatelessWidget {
  const TextButtonX({
    Key? key,
    this.title = 'TextButtonX',
    this.titleColor = const Color(0xff343a40),
    this.cornerRadius = 8.0,
    this.borderWidth = 0.0,
    this.borderColor = Colors.transparent,
    this.height = 32.0,
    this.horizontalPadding = 8.0,
    this.fontSize = 13.0,
    this.fontWeight = FontWeight.w600,
    required this.onClicked,
  }) : super(key: key);
  final String title;
  final Color titleColor;
  final double cornerRadius;
  final double borderWidth;
  final Color borderColor;
  final double height;
  final double horizontalPadding;
  final double fontSize;
  final FontWeight fontWeight;
  final GestureTapCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: const Color(0xff343a40),
        minimumSize: Size(80.0, height),
        splashFactory: NoSplash.splashFactory,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
            side: BorderSide(
              width: borderWidth,
              color: borderColor,
            )),
      ),
      onPressed: onClicked,
      child: Text(
        title,
        style: TextStyle(
            color: titleColor, fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
