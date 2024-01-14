import '../utils/logger_x.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> fcmSendPushNotification(
    List<String> userToken, String title, String body) async {
  const url = 'https://fcm.googleapis.com/fcm/send';
  const serverKey =
      'AAAAfpDRbbg:APA91bH7mnxKsJNz2MvUqQugsAwjAuFiUMmgCvJAAlU-szS0N5iBaf1_mfM0dINKjRKTH61ot7fByYH64rGdS2TKv2c2PPD6DxntSIVZCm2buF8AR5I_KxkyihmUk8b0aqoM6cQ4jHbA';

  final data = {
    "registration_ids": userToken,
    "priority": "high",
    "notification": {
      "title": title,
      "body": body,
      "sound": "default",
    },
    "data": {
      "title": title,
      "body": body,
      "some": "data",
    }
  };

  final headers = {
    'content-type': 'application/json',
    'Authorization': 'key=$serverKey'
  };

  String jsonString = json.encode(data);
  LoggerX.log('[FCM] json: $jsonString');

  final response = await http.post(Uri.parse(url),
      body: json.encode(data),
      encoding: Encoding.getByName('utf-8'),
      headers: headers);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
