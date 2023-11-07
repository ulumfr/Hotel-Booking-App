import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/main/home/webviewhotel_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewNearby extends GetView<WebviewhotelController> {
  const WebviewNearby({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel Nearby"),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: WebViewWidget(controller: controller.webviewhotelnearby),
    );
  }
}