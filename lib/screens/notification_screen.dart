import 'package:flutter/material.dart';

import '../locator.dart';
import '../service/navigation_service.dart';

class NotificationScreen extends StatelessWidget {

  final String title;
  final String body;

  const NotificationScreen({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => locator<NavigationService>().goBack(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              const SizedBox(
                height: 10,
              ),
              Text(body),
            ],
          ),
        ),
      ),
    );
  }
}
