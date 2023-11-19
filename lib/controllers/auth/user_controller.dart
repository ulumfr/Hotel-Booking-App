import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/models/auth/user_model.dart';

class UserController extends GetxController {
  final FirebaseFirestore dbUsers = FirebaseFirestore.instance;

  addUser(String id, email, password) {
    return Users(
      id: id,
      email: email,
      password: password,
    );
  }

  createUser(Users user) async {
    await dbUsers
        .collection('Users')
        .add(user.toJson())
        .whenComplete(() => null);
  }
}
