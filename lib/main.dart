import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_e_z_v/main_binding.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainBinding().dependencies();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
