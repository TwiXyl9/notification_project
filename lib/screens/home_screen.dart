import 'package:flutter/material.dart';
import 'package:notification_project/repository/token_repository.dart';
import 'package:notification_project/service/api_service.dart';

class HomeScreen extends StatelessWidget {

  final userNameController = TextEditingController();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: userNameController,
                decoration: InputDecoration(
                    labelText: 'Name',
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: bodyController,
                decoration: InputDecoration(
                  labelText: 'Body',
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () async {
                    final title = titleController.text;
                    final body = bodyController.text;
                    final userName = userNameController.text;
                    final token = await TokenRepository().getToken(userName);
                    if(title.isNotEmpty && body.isNotEmpty && userName.isNotEmpty) GoogleApiService().postSendNotification(title, body, token);
                  },
                  child: const Text('Send'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
