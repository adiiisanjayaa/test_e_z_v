import 'package:get/get.dart';
import 'package:test_e_z_v/app/data/providers/open_api_provider.dart';

class APIProvider {
  void initilizeProviders() {
    Get.lazyPut(() => OpenApiProvider(apiClient: Get.find()), fenix: true);
  }
}
