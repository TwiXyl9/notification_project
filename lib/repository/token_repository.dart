import 'package:cloud_firestore/cloud_firestore.dart';

class TokenRepository {

  final firebaseFirestore = FirebaseFirestore.instance;

  void saveToken(String token) async {
    await firebaseFirestore.collection('user_token').doc('User1').set({'token': token});
  }

  Future<String> getToken(String userName) async {
    final doc = await firebaseFirestore.collection('user_token').doc('User1').get();
    return doc.data()!['token'];
  }
}