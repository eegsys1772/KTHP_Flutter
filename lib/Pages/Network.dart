// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'Model.dart';

class NetworkRequest {
  static const String url =
      'https://61dc41e7591c3a0017e1a7f4.mockapi.io/phongban/products';

  static List<phongbanDB> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<phongbanDB> products =
        list.map((model) => phongbanDB.fromJson(model)).toList();
    return products;
  }

  static Future<List<phongbanDB>> fetchProducts({int page = 1}) async {
    final response = await http.get('$url');
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Error');
    }
  }
}
