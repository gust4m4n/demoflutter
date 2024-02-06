import 'package:get/get.dart';
import '../../viewmodels/demo_movie_list_vm.dart';

class DemoListViewController extends GetxController {
  var movieListVM = DemoMovieListVM();

  @override
  void onReady() {
    super.onReady();
    nextPage();
  }

  btnBackClicked() {
    Get.back();
  }

  nextPage() {
    update();
    movieListVM.nextPage().then((resp) {
      update();
    });
  }
}
