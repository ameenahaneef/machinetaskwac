import 'package:flutter/material.dart';
import 'package:machinetask_wac/models/most_popular.dart';
import 'package:machinetask_wac/repository/api_functions.dart';

class BestSellersProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Product> _bestSellersProduct = [];
  List<Product> get bestSellersProduct => _bestSellersProduct;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchBestSellersProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _bestSellersProduct = await _apiService.fetchBestSellersProducts();
    } catch (error) {
      print('Error fetching best sellers products: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
