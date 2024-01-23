import 'package:carousel_slider/carousel_slider.dart';
import '../../widgets/all_widgets.dart';
import 'demo_carousel_controller.dart';

class DemoCarouselScreen extends StatelessWidget {
  DemoCarouselScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoCarouselController>(
      init: DemoCarouselController(),
      builder: (controller) => ScreenX(
          lightStatusBar: true,
          headerView: NavigationBarX(
            title: 'Carousel',
            leftBtn: ImageX(
              faIcon: FontAwesomeIcons.arrowLeft,
              width: 20.0,
              height: 20.0,
              color: Colors.white,
              fit: BoxFit.contain,
            ),
            leftAction: () {
              Get.back();
            },
          ),
          bottomPadding: false,
          bodyView: Scrollbar(
              child: Material(
            child: CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    controller.setPageIndex(index);
                  },
                ),
                itemCount: controller.movieListVM.list.length,
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) {
                  if (controller.movieListVM.list.length > 0) {
                    final movie = controller.movieListVM.list[index];
                    return Padding(
                        padding: EdgeInsets.all(4.0),
                        child: ImageX(
                          url: movie.poster,
                          width: double.infinity,
                          height: double.infinity,
                          cornerRadius: 8.0,
                          fit: BoxFit.cover,
                        ));
                  } else {
                    return Container();
                  }
                }),
          ))),
    );
  }
}
