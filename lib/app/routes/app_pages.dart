import 'package:get/get.dart';

import '../modules/detailProduct/bindings/detail_product_binding.dart';
import '../modules/detailProduct/views/detail_product_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT,
      page: () => const DetailProductView(),
      binding: DetailProductBinding(),
    ),
  ];
}
