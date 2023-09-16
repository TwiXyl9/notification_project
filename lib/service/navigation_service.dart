import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_project/screens/notification_screen.dart';

import '../config/routes_names.dart';
import '../screens/home_screen.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: rootRoute, builder: ((context, state) => HomeScreen())),
      GoRoute(
          name: notificationRoute,
          path: notificationRoute,
          builder: ((context, state) {
            final title = state.queryParameters['title']!;
            final body = state.queryParameters['body']!;
            return NotificationScreen(title: title, body: body);
          })),
    ],
  );

  void navigateTo(String routeName, {data = null}) {
    router.push(routeName, extra: data);
  }

  void navigateToWithParams(String routeName, Map<String, String> params) {
    router.pushNamed(routeName, queryParameters: params);
  }

  void goBack() {
    router.pop();
  }
}
