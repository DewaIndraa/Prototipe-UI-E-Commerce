import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/product_model.dart';

class APIService {
  static Future getProduct() async {
    try {
      final response = await http.get(Uri.parse(
          'https://66181cb69a41b1b3dfbc48bb.mockapi.io/products/products'));

      if (response.statusCode == 200) {
        final body = response.body;
        final result = jsonDecode(body);
        print(result);
        List<Product> products = List<Product>.from(
          result.map(
            (product) => Product.fromJson(product),
          ),
        );
        return products;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
