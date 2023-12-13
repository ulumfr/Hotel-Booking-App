import 'dart:convert';
import 'package:get/get.dart';
import 'package:hotel_booking_app/latihan_modul6/post_model.dart';
import 'package:http/http.dart' as http;

class PostService extends GetxController {
  Future<Posts> fetchPosts() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
      return Posts.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
