import 'package:flutter/material.dart';

class DemoDrawer extends StatefulWidget {
  const DemoDrawer({Key? key}) : super(key: key);

  @override
  DemoDrawerState createState() => DemoDrawerState();
}

class DemoDrawerState extends State<DemoDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: Container(
        color: Color(0xff7029C2),
      ),
    );
  }
}
