import 'package:flutter/material.dart';
import 'package:machinetask_wac/models/category_model.dart';
import 'package:machinetask_wac/repository/api_functions.dart';

class CategoryProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Category> _categories = [];
  bool _isLoading = false;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      _categories = await _apiService.fetchCategories();
    } catch (error) {
      print('Error fetching categories: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
