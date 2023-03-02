import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:test_e_z_v/app/utility/const.dart';
import 'package:test_e_z_v/app/utility/network_checker.dart';

class ApiException implements Exception {
  String message;
  dynamic response;

  ApiException(this.response) : message = response["message"] ?? "Something Went Wrong";

  @override
  String toString() => message;
}

class NetWorkException implements Exception {
  String message;
  String exceptionType;

  NetWorkException(this.message, {this.exceptionType = 'None'});

  @override
  String toString() => message;
}

class ApiClient {
  final dio.Dio dioClient;
  final String baseUrl = Const.apiURL;
  String? device;

  ApiClient({required this.dioClient}) {
    device = "Android";
    if (GetPlatform.isIOS) device = "IOS";
  }

  final String errorConnectionTimeout = "Koneksi internet anda terputus, silahkan coba lagi.";
  final String errorReceiveTimeout = "Koneksi internet anda tidak stabil (timeout), silahkan coba lagi.";

  Future getDio(String url) async {
    log("url : $url");
    dio.Response? response;
    var isConnected = await NetworkCheck().check();
    if (isConnected) {
      try {
        try {
          response = await dioClient.get(url);
        } catch (e) {
          log("error get : $e");
        }
      } catch (e) {
        log("error getting dio : $e");
      }
    }
    return response;
  }
}
