import 'package:flutter/material.dart';
import 'all_widgets.dart';
import 'toast_x.dart';

Widget appxInternetOfflineWidget() {
  return ContainerX(
    backgroundColor: ColorX.red,
    padding:
        const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
    child: Wrap(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Expanded(
            child: TextX(
              'No internet connection',
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.left,
              maxLines: 16,
            ),
          ),
          const SizedBox(width: 8.0),
          ButtonX(
            title: 'OK',
            backgroundColor: Colors.transparent,
            borderWidth: 1.0,
            borderColor: Colors.white,
            width: 50.0,
            height: 32.0,
            onClicked: () async {
              await ToastX.dismissCustom();
            },
          )
        ]),
      ],
    ),
  );
}
