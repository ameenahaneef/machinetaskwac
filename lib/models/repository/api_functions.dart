import 'dart:convert';

import 'package:machinetask_wac/models/products_model.dart';
import 'package:http/http.dart' as http;
class ApiService{
  final String baseUrl="https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo";
  Future<Product> fetchProduct(String productId) async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }
}