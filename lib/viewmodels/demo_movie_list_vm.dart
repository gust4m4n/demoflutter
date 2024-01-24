import 'dart:async';
import '../models/demo_movie_model.dart';
import 'demo_apis.dart';

class DemoMovieListVM {
  List<DemoMovieModel> list = [];

  Future<DemoApiResponse> request() {
    return DemoApi.get(
            endpoint: '/movies',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/DemoMovieListContract.json',
            contract: true)
        .then((resp) async {
      if (resp.statusCode == 200) {
        list = [];
        for (var item in resp.jason['result'].jasonListValue) {
          var movie = DemoMovieModel.fromJason(item);
          list.add(movie);
        }
      } else {
        list = [];
      }
      return resp;
    });
  }
}
