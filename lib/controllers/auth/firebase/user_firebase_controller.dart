import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/models/auth/user_firebase_model.dart';

class UserFirebaseController extends GetxController {
  final FirebaseFirestore dbUsers = FirebaseFirestore.instance;

  addUser(String id, username, email, password) {
    return Users(
      id: id,
      username: username,
      email: email,
      password: password,
    );
  }

  createUser(Users user) async {
    await dbUsers
        .collection('users')
        .add(user.toJson())
        .whenComplete(() => null);
  }
}
