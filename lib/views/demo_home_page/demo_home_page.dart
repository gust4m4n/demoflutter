import 'package:carousel_slider/carousel_slider.dart';
import '../../widgets/all_widgets.dart';
import '../demo_image_screen/demo_image_screen.dart';
import 'demo_home_controller.dart';
import 'demo_home_grid_cell.dart';

class DemoHomePage extends StatelessWidget {
  DemoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoHomeController>(
        init: DemoHomeController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: 'Beranda',
            ),
            bottomPadding: false,
            bodyView: Material(
              child: Scrollbar(
                  child: ListView(padding: EdgeInsets.zero, children: [
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(8.0),
                  physics: ClampingScrollPhysics(),
                  itemCount: controller.movieListVM.list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0,
                    childAspectRatio: 0.58,
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final movie = controller.movieListVM.list[index];
                    return Material(
                        color: ColorX.transparent,
                        child: InkWell(
                            customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            highlightColor: ColorX.highlight,
                            onTap: () {},
                            child: DemoHomeGridCell(movie)));
                  },
                ),
                controller.movieListVM.list.length > 0
                    ? CarouselSlider.builder(
                        options: CarouselOptions(
                          padEnds: false,
                          autoPlay: true,
                          viewportFraction: 0.85,
                          height: 180.0,
                          onPageChanged: (index, reason) {
                            controller.setPageIndex(index);
                          },
                        ),
                        itemCount: controller.movieListVM.list.length,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          final movie = controller.movieListVM.list[index];
                          return Material(
                              color: ColorX.transparent,
                              child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  highlightColor: ColorX.highlight,
                                  onTap: () {
                                    Get.to(DemoImageScreen(url: movie.poster));
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: ImageX(
                                        url: movie.poster,
                                        width: double.infinity,
                                        height: double.infinity,
                                        cornerRadius: 8.0,
                                        fit: BoxFit.cover,
                                      )))); //)));
                        })
                    : Container(),
                SizedBox(height: 8.0),
              ])),
            )));
  }
}
