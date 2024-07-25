import 'package:flutter/material.dart';
import 'package:machinetask_wac/repository/api_functions.dart';
import 'package:machinetask_wac/models/slider_banner_model.dart';

class BannerSliderProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService(); 
  List<BannerContent> _bannerSliders = [];
  List<BannerContent> get bannerSliders => _bannerSliders;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchBannerSliders() async {
    _isLoading = true;
    notifyListeners();

    try {
      _bannerSliders = await _apiService.fetchBannerSliders(); 
    } catch (error) {
      print('Error fetching banner sliders: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
