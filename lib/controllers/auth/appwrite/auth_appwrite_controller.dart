import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/auth/appwrite/appwrite_controller.dart';
import 'package:hotel_booking_app/controllers/auth/appwrite/client_controller.dart';
import 'package:hotel_booking_app/controllers/main/home/profile_screen_controller.dart';
import 'package:hotel_booking_app/models/auth/user_model.dart';
import 'package:uuid/uuid.dart';

class AuthAppwriteController extends ClientController {
  Account? account;
  Databases? databases;
  late User _currentUser;

  User get currentUser => _currentUser;
  String? get username => _currentUser.name;
  final ProfileScreenController controller = Get.find<ProfileScreenController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

  bool isSecure = true;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Get.put(ProfileScreenController());
    account = Account(client);
    databases = Databases(client);
  }

  Future createAccount(Map map) async {
    try {
      await account!.create(
        userId: map['userId'],
        email: map['email'],
        password: map['password'],
        name: map['name'],
      );
      Get.snackbar(
        'Success',
        'Registration Successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future createEmailSession(Map map) async {
    try {
      await account!.createEmailSession(
        email: map['email'],
        password: map['password'],
      );
      Get.snackbar(
        'Success',
        'Login Successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  void signup() {
    try {
      final unikuserId = const Uuid().v4();
      final userId = unikuserId.replaceAll('-', '');
      if (passwordController.text == confPasswordController.text) {
        Map<String, dynamic> userData = {
          'userId': userId,
          'email': emailController.text,
          'password': passwordController.text,
          'name': nameController.text,
        };
        createAccount(userData);
        createDoc(userData);
        goLogin();
      } else {
        print('Password and confirm password do not match');
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'Register Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
      );
    }
  }

  void login() {
    try {
      createEmailSession({
        'email': emailController.text,
        'password': passwordController.text,
      }).then((result) async {
        if (account != null) {
          _currentUser = await account!.get();
          goMain();
        } else {
          print('Account is null');
        }
      }).catchError((error) {
        Get.defaultDialog(
          title: "Error Account",
        );
      });
    } catch (error) {
      Get.snackbar(
        'Error',
        'Login Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
      );
    }
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;
      account?.deleteSession(sessionId: 'current');
      Get.snackbar(
        'Succes',
        'Logout Successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );
      goLogin();
    } catch (error) {
      Get.snackbar(
        'Error',
        'Logout Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // void updateData(){
  //   updateDoc(docId);
  // }



  Future<void> createDoc(Map<String, dynamic> map) async{
    final docIds = ID.unique();
    print("ini docs $docIds");
    final unikuserId = const Uuid().v4();
    final docId = unikuserId.replaceAll('-', '');
    final documents = Users(
      docId: docId,
      id: map['userId'],
      username: map['name'],
      password: map['password'],
      email: map['email']
    );
    await databases!.createDocument(
        databaseId: AppwriteController.userdb,
        collectionId: AppwriteController.usercol,
        documentId: docId,
        data: documents.toJson()
    );
    // final users = userData.data;
    // final savedId = users['docId'];
    getDoc(docId);
  }

  Future<void> getDoc(String uid) async {
    final query = Query.equal('userId', uid);

    final response = await databases!.getDocument(
        databaseId: AppwriteController.userdb,
        collectionId: AppwriteController.usercol,
        documentId: uid
    );

    final documentData = response.data;
    final doc = Users.fromJson(documentData);
    controller.nameController.text = doc.username!;
    controller.passwordController.text = doc.password!;
    controller.emailController.text = doc.email!;
    controller.phoneController.text = doc.phone as String;
  }

  Future updateDoc(String uid) async {
    final user = Users(
      username: controller.nameController.text,
      password: controller.passwordController.text,
      email: controller.emailController.text,
      phone: controller.phoneController.text
    );

    await databases!.updateDocument(
        databaseId: AppwriteController.userdb,
        collectionId: AppwriteController.usercol,
        documentId: uid,
        data: user.toJson(),
    );
  }


  // void logout() async {
  //   try {
  //     isLoading.value = true;
  //     Get.snackbar(
  //       'Succes',
  //       'Logout Successful',
  //       backgroundColor: AppColors.primaryColor,
  //       colorText: AppColors.whiteColor,
  //     );
  //     goLogin();
  //   } catch (error) {
  //     Get.snackbar(
  //       'Error',
  //       'Logout Failed: $error',
  //       backgroundColor: AppColors.secondaryColor,
  //       colorText: AppColors.whiteColor,
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }



  void goLogin() {
    clear();
    Get.toNamed('/loginAppwrite');
  }

  void goSignup() {
    clear();
    Get.toNamed('/signupAppwrite');
  }

  void goForgot() {
    Get.toNamed('/forgotAppwrite');
  }

  void goVerify() {
    Get.toNamed('/verifyAppwrite');
  }

  void goResetPass() {
    Get.toNamed('/resetAppwrite');
  }

  void goMain() {
    clear();
    Get.offAndToNamed('/main');
  }

  void goEdit() {
    Get.toNamed('/editProfile');
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confPasswordController.clear();
  }
}
