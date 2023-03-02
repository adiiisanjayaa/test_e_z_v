import 'package:get/get.dart';
import 'package:test_e_z_v/app/data/models/product_model.dart';
import 'package:test_e_z_v/app/data/providers/open_api_provider.dart';

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
    loading(false);
  }

  loading(bool value) {
    isLoading = value;
    update();
  }
}
