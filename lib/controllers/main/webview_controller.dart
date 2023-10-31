import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewControllerController extends GetxController {
  final Rx<WebViewController?> webViewController = Rx<WebViewController?>(null);

  void initController() {
    webViewController.value = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse('https://www.traveloka.com/en-id/hotel'));
  }
}
