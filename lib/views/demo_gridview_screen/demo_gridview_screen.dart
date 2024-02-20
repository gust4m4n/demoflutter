import '../../widgets/all_widgets.dart';
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
              loading: controller.movieListVM.list.isEmpty &&
                  controller.movieListVM.loading,
              headerView: NavigationBarX(
                title: 'GridView',
                leftBtn: ImageX(
                  faIcon: FontAwesomeIcons.arrowLeft,
                  width: 20.0,
                  height: 20.0,
                  color: ColorX.white,
                  fit: BoxFit.contain,
                ),
                leftAction: () {
                  controller.btnBackClicked();
                },
              ),
              bottomPadding: false,
              bodyView: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (controller.movieListVM.loading == false &&
                        scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                      controller.nextPage();
                    }
                    return true;
                  },
                  child: Material(
                      child: Scrollbar(
                    child: GridView.builder(
                      padding: EdgeInsets.only(
                          left: 8.0,
                          top: 8.0,
                          right: 8.0,
                          bottom:
                              8.0 + MediaQuery.of(Get.context!).padding.bottom),
                      physics: ClampingScrollPhysics(),
                      itemCount: controller.movieListVM.list.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 0.65,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
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
                                child: DemoGridViewCell(movie)));
                      },
                    ),
                  ))),
            ));
  }
}
