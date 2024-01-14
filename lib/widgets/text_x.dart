import 'package:flutter/material.dart';

class TextX extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final bool underline;
  final int maxLines;

  const TextX(
    this.text, {
    Key? key,
    this.fontFamily = 'Roboto',
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    required this.textAlign,
    this.underline = false,
    required this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none),
    );
  }
}
