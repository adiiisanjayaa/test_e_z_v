import 'dart:developer';

import 'package:get/get.dart';
import 'package:test_e_z_v/app/data/models/product_model.dart';

class DetailProductController extends GetxController {
  Products? product;

  @override
  void onReady() {
    var args = Get.arguments;
    try {
      product = args as Products;
      update();
    } catch (e) {
      log("error: $e");
    }
    super.onReady();
  }
}
