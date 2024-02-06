import 'package:get/get.dart';
import '../../viewmodels/demo_movie_list_vm.dart';

class DemoListViewController extends GetxController {
  var movieListVM = DemoMovieListVM();

  @override
  void onReady() {
    super.onReady();
    update();
    nextPage();
  }

  btnBackClicked() {
    Get.back();
  }

  nextPage() {
    movieListVM.nextPage().then((resp) {
      update();
    });
  }
}
