// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/controllers/auth/appwrite/appwrite_controller.dart';
import 'package:hotel_booking_app/controllers/auth/appwrite/client_controller.dart';
import 'package:hotel_booking_app/models/main/horizontal_card_model.dart';
import 'package:hotel_booking_app/models/main/vertical_card_model.dart';

class HomeScreenController extends ClientController {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // FirebaseStorage storage = FirebaseStorage.instance;
  RxList<HotelHorizontalCard> hotelsHorizontal = <HotelHorizontalCard>[].obs;
  RxList<HotelVerticalCard> hotelsVertical = <HotelVerticalCard>[].obs;

  late Databases database;
  late Storage storage;

  @override
  void onInit() {
    super.onInit();
    database = Databases(client);
    storage = Storage(client);
    fetchData();
    // getData();
  }

  Future<void> fetchData() async {
    try {
      final response = await database.listDocuments(
        databaseId: AppwriteController.dbDataHotel,
        collectionId: AppwriteController.hotelsDetails,
      );

      List<HotelHorizontalCard> hotelHorizontalList = [];
      List<HotelVerticalCard> hotelVerticalList = [];

      for (var i = 0; i < response.documents.length; i++) {
        var doc = response.documents[i];
        String gsUrl = doc.data["photo"];
        String downloadUrl = await getDownloadUrl(gsUrl);

        if (i % 2 == 0) {
          hotelHorizontalList.add(HotelHorizontalCard.fromJson({
            "name": doc.data["name"],
            "location": doc.data["location"],
            "price": doc.data["price"],
            "rating": doc.data["rating"],
            "photo": downloadUrl,
          }));
        } else {
          hotelVerticalList.add(HotelVerticalCard.fromJson({
            "name": doc.data["name"],
            "location": doc.data["location"],
            "price": doc.data["price"],
            "rating": doc.data["rating"],
            "photo": downloadUrl,
          }));
        }
      }
      hotelsHorizontal.assignAll(hotelHorizontalList);
      hotelsVertical.assignAll(hotelVerticalList);
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
  //kgk bisa ke download
  Future<String> getDownloadUrl(String fileId) async {
    try {
      final response = await storage.getFileDownload(
        fileId: fileId,
        bucketId: AppwriteController.storageHotel,
      );
      return response.toString();
    } catch (e) {
      print('Error getting download URL: $e');
      return ''; // Atau atur penanganan kesalahan sesuai logika aplikasi kamu
    }
  }

  void goWebviewPopular() {
    Get.toNamed('/webpopular');
  }

  void goWebviewNearby() {
    Get.toNamed('/webnearby');
  }
}

  // Future<void> getData() async {
  //   CollectionReference details = firestore.collection("hotel_details");
  //   var querySnapshot = await details.get();

  //   List<HotelHorizontalCard> hotelHorizontalList = [];
  //   List<HotelVerticalCard> hotelVerticalList = [];

  //   for (var i = 0; i < querySnapshot.docs.length; i++) {
  //     var doc = querySnapshot.docs[i];
  //     String gsUrl = doc["photo"] as String;
  //     String downloadUrl = await getDownloadUrl(gsUrl);

  //     if (i % 2 == 0) {
  //       hotelHorizontalList.add(HotelHorizontalCard.fromMap({
  //         "name": doc["name"],
  //         "location": doc["location"],
  //         "price": doc["price"],
  //         "rating": doc["rating"],
  //         "photo": downloadUrl,
  //       }));
  //     } else {
  //       hotelVerticalList.add(HotelVerticalCard.fromMap({
  //         "name": doc["name"],
  //         "location": doc["location"],
  //         "price": doc["price"],
  //         "rating": doc["rating"],
  //         "photo": downloadUrl,
  //       }));
  //     }
  //   }
  //   hotelsHorizontal.assignAll(hotelHorizontalList);
  //   hotelsVertical.assignAll(hotelVerticalList);
  // }

  // Future<String> getDownloadUrl(String gsUrl) async {
  //   Reference ref = storage.refFromURL(gsUrl);
  //   return await ref.getDownloadURL();
  // }
