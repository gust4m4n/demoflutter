import '../utils/all_utils.dart';

class DemoProfileModel {
  String name = '';
  String email = '';
  String photo = '';

  DemoProfileModel();

  decode(Jason jason) {
    name = jason['name'].stringValue;
    email = jason['email'].stringValue;
    photo = jason['photo'].stringValue;
  }
}
