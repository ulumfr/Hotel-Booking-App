import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/models/main/horizontal_card_model.dart';
import 'package:hotel_booking_app/models/main/vertical_card_model.dart';

class HomeScreenController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  RxList<HotelHorizontalCard> hotelsHorizontal = <HotelHorizontalCard>[].obs;
  RxList<HotelVerticalCard> hotelsVertical = <HotelVerticalCard>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    CollectionReference details = firestore.collection("hotel_details");
    var querySnapshot = await details.get();

    List<HotelHorizontalCard> hotelHorizontalList = [];
    List<HotelVerticalCard> hotelVerticalList = [];

    for (var i = 0; i < querySnapshot.docs.length; i++) {
      var doc = querySnapshot.docs[i];
      String gsUrl = doc["photo"] as String;
      String downloadUrl = await getDownloadUrl(gsUrl);

      if (i % 2 == 0) {
        hotelHorizontalList.add(HotelHorizontalCard.fromMap({
          "name": doc["name"],
          "location": doc["location"],
          "price": doc["price"],
          "rating": doc["rating"],
          "photo": downloadUrl,
        }));
      } else {
        hotelVerticalList.add(HotelVerticalCard.fromMap({
          "name": doc["name"],
          "location": doc["location"],
          "price": doc["price"],
          "rating": doc["rating"],
          "photo": downloadUrl,
        }));
      }
      // if (i == 7) {
      //   break;
      // }
    }
    hotelsHorizontal.assignAll(hotelHorizontalList);
    hotelsVertical.assignAll(hotelVerticalList);
  }

  Future<String> getDownloadUrl(String gsUrl) async {
    Reference ref = storage.refFromURL(gsUrl);
    return await ref.getDownloadURL();
  }

  void goWebviewPopular() {
    Get.toNamed('/webpopular');
  }

  void goWebviewNearby() {
    Get.toNamed('/webnearby');
  }
}
