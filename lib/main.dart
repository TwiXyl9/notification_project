import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notification_project/service/firebase_messaging_service.dart';
import 'package:notification_project/service/navigation_service.dart';
import 'package:notification_project/service/notification_service.dart';

import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessagingService().initNotifications();
  await NotificationService.initialize();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: locator<NavigationService>().router,
    );
  }
}
