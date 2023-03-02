import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_e_z_v/app/data/models/product_model.dart';
import 'package:test_e_z_v/app/utility/storage_name.dart';

class LocalStorage {
  static Future saveAllData(ModelProduct data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var newData = data.toJson();
      await prefs.setString(StorageNames.productsId, json.encode(newData));
    } catch (e) {
      log("error $e");
    }
  }

  static Future<ModelProduct?> getAllData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var data = prefs.getString(StorageNames.productsId);
      if (data != null) {
        return ModelProduct.fromJson(json.decode(data));
      }
    } catch (e) {
      log("error $e");
    }
    return null;
  }

  static Future saveToLocal(num data) async {
    try {
      var local = await getLocal();
      if (local.contains(data)) {
        local.remove(data);
      } else {
        local.add(data);
      }
      final prefs = await SharedPreferences.getInstance();
      if (local.isNotEmpty) {
        local = local.toSet().toList();
        final Map<String, dynamic> data = <String, dynamic>{};
        data['products_id'] = local.map((v) => v).toList();
        await prefs.setString(StorageNames.productsId, json.encode(data));
      } else {
        await prefs.remove(StorageNames.productsId);
      }
    } catch (e) {
      log("error $e");
    }
  }

  static Future<List<num>> getLocal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var data = prefs.getString(StorageNames.productsId);
      List<num> products = [];
      if (data != null) {
        var newData = json.decode(data);
        if (newData != null) {
          newData['products_id'].forEach((v) {
            products.add(v);
          });
        }
        return products;
      }
      return [];
    } catch (e) {
      log("error $e");
      return [];
    }
  }
}
