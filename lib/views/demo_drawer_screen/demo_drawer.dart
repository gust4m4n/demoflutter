import 'package:flutter/material.dart';

import '../../widgets/all_widgets.dart';

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
        color: ColorX.blue,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
