import 'package:get/get.dart';
import 'package:test_e_z_v/app/data/models/product_model.dart';
import 'package:test_e_z_v/app/data/providers/open_api_provider.dart';
import 'package:test_e_z_v/app/utility/local_storage.dart';

class HomeController extends GetxController {
  HomeController({required this.openApiProvider});

  final OpenApiProvider openApiProvider;
  ModelProduct? products;
  bool isLoading = false;

  @override
  void onReady() {
    getProduct();
    super.onReady();
  }

  getProduct() async {
    loading(true);
    products = await openApiProvider.getProducts();
    if (products != null) {
      LocalStorage.saveAllData(products!);
    } else {
      products = await LocalStorage.getAllData();
    }

    loading(false);
  }

  loading(bool value) {
    isLoading = value;
    update();
  }

  save(Products? product) async {
    if (product != null) {
      await LocalStorage.saveToLocal(product.id!);
      return isFav(product);
    }
    update();
  }

  Future<bool> isFav(Products? product) async {
    if (product != null) {
      var local = await LocalStorage.getLocal();
      if (local.contains(product.id)) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
