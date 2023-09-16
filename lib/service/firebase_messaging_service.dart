import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notification_project/repository/token_repository.dart';

import 'notification_service.dart';


Future<void> handleMessage(RemoteMessage message) async {
  NotificationService.show(title: message.notification!.title!, body: message.notification!.body!, payload: Map<String,String>.from(message.data));
}

class FirebaseMessagingService {

  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final token = await getToken();

    TokenRepository().saveToken(token!);

    FirebaseMessaging.onBackgroundMessage(handleMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      handleMessage(message);
    });
  }

  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }

}