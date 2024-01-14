import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'container_x.dart';
import 'statusbar_x.dart';

class ScreenX extends StatelessWidget {
  final Key? scaffoldKey;
  final Widget? drawer;
  final Widget? headerView;
  final Widget? bodyView;
  final bool topPadding;
  final bool bottomPadding;
  final bool lightStatusBar;

  const ScreenX({
    Key? key,
    this.scaffoldKey,
    this.drawer,
    this.headerView,
    this.bodyView,
    this.topPadding = false,
    this.bottomPadding = false,
    required this.lightStatusBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (lightStatusBar == true) {
      StatusBarX.setLight();
    } else {
      StatusBarX.setDark();
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: StatusBarX.theme,
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
                key: scaffoldKey,
                backgroundColor: Colors.white,
                drawer: drawer,
                body: Column(children: [
                  SizedBox(
                    height: topPadding
                        ? MediaQuery.of(Get.context!).padding.top
                        : 0.0,
                  ),
                  if (headerView != null) headerView!,
                  Expanded(
                      child: ContainerX(
                          height: double.infinity,
                          width: double.infinity,
                          clipBehavior: Clip.none,
                          child: bodyView ??
                              ContainerX(backgroundColor: Colors.transparent))),
                  SizedBox(
                    height: bottomPadding
                        ? MediaQuery.of(Get.context!).padding.bottom
                        : 0.0,
                  ),
                ]))));
  }
}
