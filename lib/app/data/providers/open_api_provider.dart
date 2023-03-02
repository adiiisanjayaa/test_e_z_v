import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_e_z_v/app/data/models/product_model.dart';
import 'package:test_e_z_v/app/utility/api_method.dart';

class OpenApiProvider {
  final ApiClient apiClient;
  OpenApiProvider({required this.apiClient});

  Future<ModelProduct?> getProducts() async {
    try {
      String url = '/products';
      Response response = await apiClient.getDio(url);
      return ModelProduct.fromJson(response.data);
    } catch (e) {
      log("errror get product : $e");
      return null;
    }
  }
}
