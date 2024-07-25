import 'package:flutter/material.dart';
import 'package:machinetask_wac/repository/api_functions.dart';
import 'package:machinetask_wac/models/single_banner.dart';

class SingleBannerProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  SingleBanner? _singleBanner;
  SingleBanner? get singleBanner => _singleBanner;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchSingleBanner() async {
    _isLoading = true;
    notifyListeners();

    try {
      _singleBanner = await _apiService.fetchSingleBanner();
    } catch (error) {
      print('Error fetching single banner: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
