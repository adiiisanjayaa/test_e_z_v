import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_e_z_v/app/data/providers/index.dart';
import 'package:test_e_z_v/app/utility/api_method.dart';
import 'package:test_e_z_v/app/utility/const.dart';

class MainBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(
      ApiClient(
        dioClient: Dio(
          BaseOptions(
            baseUrl: Const.apiURL,
            connectTimeout: Const.connectionTimeout,
            receiveTimeout: Const.connectionTimeout,
          ),
        ),
      ),
      permanent: true,
    );
    APIProvider().initilizeProviders();
    log("Main binded");
  }
}
