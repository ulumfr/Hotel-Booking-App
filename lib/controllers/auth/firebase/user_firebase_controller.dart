import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/controllers/main/home/profile_screen_controller.dart';
import 'package:hotel_booking_app/models/auth/user_firebase_model.dart';

class UserFirebaseController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late final FirebaseFirestore dbUsers = FirebaseFirestore.instance;
  // final controller = Get.put(ProfileScreenController());
  // DocumentSnapshot? doc;
  RxList<Users> userdat = <Users>[].obs;

  addUser(Map<String, dynamic> user) {
    return Users(
      docId: user['docId'],
      id: user['id'],
      username: user['username'],
      email: user['email'],
      password: user['password'],
      phone: user['phone'] ?? ""
    );
  }

  createUser(Users user) async {
    await dbUsers
        .collection('users')
        .add(user.toJson())
        .whenComplete(() => null);
  }

  getUser(String email) async {
    final doc = await dbUsers.collection('users').doc(email).get();

    if(doc.exists){
      final data = doc.data();
      final user = Users.fromJson(data!);
      userdat.add(user);
      // userdat.assignAll(addUser(doc));
      // controller.nameController.text = user.username;
      // controller.passwordController.text = user.password!;
      // controller.phoneController.text = user.phone!;

    } else {
      return null;
    }
  }
  updateDoc(Users user){
    final userId = userdat[0].id;

    // if(userdat[0].username != controller.nameController){
    //   // update the username saved in firestore
    //
    // }
    // if(userdat[0].phone != controller.phoneController.text){
    //   // update the phone number in firestore
    // }

  }
}
