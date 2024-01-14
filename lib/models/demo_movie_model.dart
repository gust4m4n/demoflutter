import '../utils/jason_x.dart';

class DemoMovieModel {
  int id = 0;
  String poster = '';
  int revenue = 0;
  String title = '';

  DemoMovieModel(Jason jason) {
    id = jason['id'].intValue;
    poster = jason['poster'].stringValue;
    revenue = jason['revenue'].intValue;
    title = jason['title'].stringValue;
  }
}
