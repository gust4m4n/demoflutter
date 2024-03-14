import '../utils/all_utils.dart';

class DemoProfileModel {
  String token = '';
  String name = '';
  String email = '';
  String photo = '';

  DemoProfileModel();

  decode(Jason jason) {
    token = jason['token'].stringValue;
    name = jason['name'].stringValue;
    email = jason['email'].stringValue;
    photo = jason['photo'].stringValue;
  }

  Jason encode() {
    final jason = Jason();
    jason['token'] = token;
    jason['name'] = name;
    jason['email'] = email;
    jason['photo'] = photo;
    return jason;
  }
}
