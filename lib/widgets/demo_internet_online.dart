import 'package:flutter/material.dart';
import 'all_widgets.dart';

Widget demoInternetOnlineWidget() {
  return ContainerX(
    backgroundColor: ColorX.green,
    padding:
        const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
    child: Wrap(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Expanded(
            child: TextX(
              'Back to online',
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.start,
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
