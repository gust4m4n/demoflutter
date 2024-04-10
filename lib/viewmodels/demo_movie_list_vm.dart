import 'dart:async';
import '../models/demo_movie_model.dart';
import 'demo_apis.dart';

class DemoMovieListVM {
  var loading = false;
  List<DemoMovieModel> list = [];
  List<DemoMovieModel> filtered = [];

  clear() {
    list = [];
  }

  Future<DemoApiResponse> nextPage() {
    loading = true;
    return DemoApi.get(
            endpoint: '/movies',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/DemoMovieListContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.statusCode == 200) {
        for (var item in resp.jason['result'].jasonListValue) {
          var movie = DemoMovieModel.fromJason(item);
          list.add(movie);
        }
      }
      return resp;
    });
  }

  sort() {
    list.sort((a, b) => a.title.compareTo(b.title));
  }

  setFilter(String keyword) {
    filtered = [];
    for (var item in list) {
      if (keyword.isEmpty) {
        filtered.add(item);
      } else {
        if (item.title.toLowerCase().contains(keyword.toLowerCase())) {
          filtered.add(item);
        }
      }
    }
  }
}
