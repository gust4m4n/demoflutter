import 'package:get/get.dart';
import '../../viewmodels/demo_movie_list_vm.dart';

class DemoCarouselController extends GetxController {
  var movieListVM = DemoMovieListVM();
  var pageIndex = 0;

  @override
  void onReady() {
    super.onReady();
    movieListVM.request().then((resp) {
      if (resp.statusCode == 200) {
        update();
      }
    });
  }

  setPageIndex(int index) {
    pageIndex = index;
  }
}
