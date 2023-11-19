
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/models/user_model.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  addUser(String id, email, password){
    return Users(
      id: id,
      email: email,
      password: password
    );
  }
  createUser(Users user) async {
    await _db.collection('Users').add(user.toJson()).whenComplete(() => null);
  }
}