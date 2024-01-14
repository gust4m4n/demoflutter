import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'all_widgets.dart';

class NavigationBarX extends StatelessWidget {
  final String? title;
  final String? leftIcon;
  final Color? leftIconColor;
  final GestureTapCallback? leftAction;
  final String? rightIcon;
  final Color? rightIconColor;
  final GestureTapCallback? rightAction;
  NavigationBarX(
      {this.title,
      this.leftIcon,
      this.leftIconColor,
      this.leftAction,
      this.rightIcon,
      this.rightIconColor,
      this.rightAction});

  @override
  Widget build(BuildContext context) {
    return ContainerX(
        backgroundColor: ColorX.blue,
        height: MediaQuery.of(Get.context!).padding.top + 50.0,
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(Get.context!).padding.top,
          ),
          ContainerX(
              height: 50.0,
              child: Material(
                  color: ColorX.blue,
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        leftIcon != null
                            ? InkWell(
                                splashFactory: NoSplash.splashFactory,
                                onTap: () =>
                                    leftAction != null ? leftAction!() : null,
                                child: ImageX(
                                  url: leftIcon!,
                                  width: 60.0,
                                  height: 50.0,
                                  color: leftIconColor,
                                  fit: BoxFit.contain,
                                ),
                              )
                            : const SizedBox(width: 60.0, height: 50.0),
                        Expanded(
                          child: TextX(
                            title ?? '',
                            color: Colors.white,
                            fontSize: 17.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        ),
                        rightIcon != null
                            ? InkWell(
                                onTap: () =>
                                    rightAction != null ? rightAction!() : null,
                                child: ImageX(
                                  url: rightIcon!,
                                  width: 60.0,
                                  height: 50.0,
                                  color: rightIconColor,
                                  fit: BoxFit.contain,
                                ),
                              )
                            : const SizedBox(width: 60.0, height: 50.0),
                      ],
                    ),
                  ]))),
        ]));
  }
}
