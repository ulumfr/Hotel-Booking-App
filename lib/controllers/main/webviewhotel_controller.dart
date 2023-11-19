import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewhotelController extends GetxController {
  var webviewhotelpopular = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.traveloka.com/en-id/hotel'));

  var webviewhotelnearby = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.booking.com/city/id/malang.id.html'));
}
