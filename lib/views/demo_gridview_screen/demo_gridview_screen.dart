import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/navigationbar_x.dart';
import '../../widgets/screen_x.dart';
import '../demo_image_screen/demo_image_screen.dart';
import 'demo_gridview_controller.dart';
import 'demo_gridview_cell.dart';

class DemoGridViewScreen extends StatelessWidget {
  DemoGridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoGridViewController>(
      init: DemoGridViewController(),
      builder: (controller) => ScreenX(
          lightStatusBar: true,
          headerView: NavigationBarX(
            title: 'GridView',
            leftIcon: 'lib/images/ic_demo_back.png',
            leftIconColor: Colors.white,
            leftAction: () {
              Get.back();
            },
          ),
          bottomPadding: false,
          bodyView: Scrollbar(
              child: Material(
            child: GridView.builder(
              padding: EdgeInsets.only(
                  left: 8.0,
                  top: 8.0,
                  right: 8.0,
                  bottom: 8.0 + MediaQuery.of(Get.context!).padding.bottom),
              physics: ClampingScrollPhysics(),
              itemCount: controller.movieListVM.list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                final movie = controller.movieListVM.list[index];
                return Material(
                    color: Colors.transparent,
                    child: InkWell(
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        highlightColor: const Color(0xffE3E3E3),
                        onTap: () {
                          Get.to(DemoImageScreen(url: movie.poster));
                        },
                        child: DemoGridViewCell(movie)));
              },
            ),
          ))),
    );
  }
}
