import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/auth/appwrite/appwrite_controller.dart';
import 'package:hotel_booking_app/controllers/auth/appwrite/client_controller.dart';
import 'package:hotel_booking_app/controllers/main/home/profile_screen_controller.dart';
import 'package:hotel_booking_app/models/auth/user_appwrite_model.dart';
import 'package:uuid/uuid.dart';

class AuthAppwriteController extends ClientController {
  Account? account;
  Databases? databases;
  late User _currentUser;
  RxList<Users> userdat = <Users>[].obs;
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
    // try {
      createEmailSession({
        'email': emailController.text,
        'password': passwordController.text,
      }).then((result) async {
        if (account != null) {
          // final test = result.userId;
          _currentUser = await account!.get();
          final ekr = _currentUser.$id;
          getDoc(ekr);
          // final Users user = Get.arguments as Users;

          goMain();
        } else {
          print('Account is null');
        }
      // }).catchError((error) {
      //   Get.defaultDialog(
      //     title: "Error Account",
      //   );
      }
        );
    // } catch (error) {
    //   Get.snackbar(
    //     'Error',
    //     'Login Failed: $error',
    //     backgroundColor: AppColors.secondaryColor,
    //     colorText: AppColors.whiteColor,
    //   );
    // }
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
    // getDoc(documents.docId);
  }

  Future<void> getDoc(String uid) async {
    final query = Query.equal('userId', uid);
    //
    final response = await databases!.listDocuments(
        databaseId: AppwriteController.userdb,
        collectionId: AppwriteController.usercol,
        queries: [query]
    );

    final documentData = response.documents;
    final datas = documentData.map((e) => Users.fromJson(e.data)).toList();

    userdat.assignAll(datas);
    // final doc = Users.fromJson(documentData.data);
    controller.nameController.text = datas[0].username!;
    controller.passwordController.text = datas[0].password!;
    controller.emailController.text = datas[0].email!;
    if(datas[0].phone!.startsWith("+")){
      final nohp = datas[0].phone!.replaceAll("+", "");
      controller.phoneController.text = nohp;
    }else{
      controller.phoneController.text = datas[0].phone!;
    }
  }

  Future updateDoc() async {
    final userId = userdat[0].id;
    // if(userdat[0].password != controller.passwordController.text){
    //   account!.updatePassword(password: controller.passwordController.text);
    //   // account!.updateEmail(email: userdat[0].email!, password: controller.passwordController.text);
    //   // getDoc(userdat[0].id!);
    // }
    // if(userdat[0].email != controller.emailController.text){
    //   account!.updateEmail(email: controller.emailController.text, password: controller.passwordController.text);
    //   // account!.updatePassword(password: userdat[0].password!);
    //   // getDoc(userdat[0].id!);
    // }
    if(userdat[0].username != controller.nameController.text){
      account!.updateName(name: controller.nameController.text);
      // getDoc(userdat[0].id!);
    }
    if(userdat[0].phone != controller.phoneController.text){
      account!.updatePhone(phone: "+${controller.phoneController.text}", password: userdat[0].password!);
      // getDoc(userdat[0].id!);
    }

    final user = Users(
      id: userdat[0].id,
      docId: userdat[0].docId,
      username: controller.nameController.text,
      password: controller.passwordController.text,
      email: controller.emailController.text,
      phone: controller.phoneController.text
    );

    await databases!.updateDocument(
        databaseId: AppwriteController.userdb,
        collectionId: AppwriteController.usercol,
        documentId: userdat[0].docId!,
        data: user.toJson(),
    );
    // userdat.clear();
    getDoc(userId!);
  }

  Future<void> deleteAccount() async {
    try {
      await databases!.deleteDocument(
        databaseId: AppwriteController.userdb,
        collectionId: AppwriteController.usercol,
        documentId: userdat[0].docId!,
      );
      goLogin();
      Get.snackbar(
        'Success',
        'Deleted User Database Successfully',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );
    } catch (error) {
      print('$error');
      Get.snackbar(
        'Error',
        'Failed to Delete Account: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
      );
    }
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
    Get.toNamed('/main');
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
