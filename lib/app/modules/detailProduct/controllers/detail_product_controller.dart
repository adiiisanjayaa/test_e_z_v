import 'dart:developer';

import 'package:get/get.dart';
import 'package:test_e_z_v/app/data/models/product_model.dart';
import 'package:test_e_z_v/app/utility/local_storage.dart';

class DetailProductController extends GetxController {
  Products? product;
  bool isFavorite = false;
  @override
  void onReady() {
    var args = Get.arguments;
    try {
      product = args as Products;
      update();
      save();
    } catch (e) {
      log("error: $e");
    }
    super.onReady();
  }

  save() async {
    if (product != null) {
      await LocalStorage.saveToLocal(product!.id!);
      var local = await LocalStorage.getLocal();
      if (local.contains(product!.id)) {
        isFavorite = true;
      } else {
        isFavorite = false;
      }
    }
    log(isFavorite.toString());
    update();
  }
}
