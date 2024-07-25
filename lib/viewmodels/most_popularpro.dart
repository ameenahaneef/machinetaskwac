import 'package:flutter/material.dart';
import 'package:machinetask_wac/models/most_popular.dart';
import 'package:machinetask_wac/repository/api_functions.dart';

class MostPopularProductsProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Product> _mostPopularProducts = [];
  List<Product> get mostPopularProducts => _mostPopularProducts;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchMostPopularProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _mostPopularProducts = await _apiService.fetchMostPopularProducts();
    } catch (error) {
      print('Error fetching most popular products: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
