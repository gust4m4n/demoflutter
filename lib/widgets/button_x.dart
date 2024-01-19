import 'package:flutter/material.dart';
import 'image_x.dart';
import 'text_x.dart';

class ButtonX extends StatelessWidget {
  final IconData? faIcon;
  final double faWidth;
  final double faHeight;
  final Color? faColor;
  final String title;
  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color titleColor;
  final Color disabledTitleColor;
  final double cornerRadius;
  final double borderWidth;
  final Color borderColor;
  final Color highlightColor;
  final double width;
  final double height;
  final double horizontalPadding;
  final double fontSize;
  final FontWeight fontWeight;
  final bool enabled;
  final GestureTapCallback onClicked;

  const ButtonX({
    Key? key,
    this.faIcon = null,
    this.faWidth = 24.0,
    this.faHeight = 24.0,
    this.faColor = null,
    this.title = 'Button',
    this.backgroundColor = Colors.black,
    this.disabledBackgroundColor = const Color(0xffE0E5EF),
    this.titleColor = Colors.white,
    this.disabledTitleColor = const Color(0xff86898F),
    this.cornerRadius = 8.0,
    this.borderWidth = 0.0,
    this.borderColor = Colors.transparent,
    this.highlightColor = Colors.white,
    this.width = double.infinity,
    this.height = 48.0,
    this.horizontalPadding = 8.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w700,
    this.enabled = true,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.all(
          Radius.circular(cornerRadius),
        ),
        color: enabled == true ? backgroundColor : disabledBackgroundColor,
        child: InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: enabled == true ? onClicked : null,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(
                    width: borderWidth,
                    color: enabled == true ? borderColor : Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(cornerRadius),
                ),
              ),
              child: Center(
                  child: faIcon != null
                      ? ImageX(
                          faIcon: faIcon,
                          color: faColor,
                          width: faWidth,
                          height: faHeight)
                      : TextX(
                          title,
                          color:
                              enabled == true ? titleColor : disabledTitleColor,
                          fontSize: fontSize,
                          fontFamily: 'Roboto',
                          fontWeight: fontWeight,
                          textAlign: TextAlign.start,
                          maxLines: 2048,
                        )),
            )));
  }
}