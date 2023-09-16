import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/secrets/google_api_keys.dart';

class GoogleApiService {

  Future<void> postSendNotification(String title, String body, String token) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'key=${GoogleApiKeys.SERVER_KEY}'
        },
        body: jsonEncode(<String, dynamic>{
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'status': 'done',
            'body': body,
            'title': title,
            'navigate': 'true'
          },
          'notification': <String, dynamic>{
            'title': title,
            'body': body,
            'android_channel_id': 'example_id'
          },
          'to': token
        }),
      );
    } on Exception catch (e) {
      print("Error with sending push notification - $e");
    }
  }
}
