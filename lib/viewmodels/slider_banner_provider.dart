import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:machinetask_wac/models/slider_banner_model.dart';
import 'package:http/http.dart' as http;

class BannerProvider extends ChangeNotifier {
  List<BannerSlider>? _bannerSliders;
  bool _isLoading = false;

  List<BannerSlider>? get bannerSliders => _bannerSliders;
  bool get isLoading => _isLoading;

  Future<void> fetchBannerData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo'));

      if (response.statusCode == 200) {

        final data = jsonDecode(response.body) as List<dynamic>;
        
        _bannerSliders = data.map((json) => BannerSlider.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to load banner data');
      }
    } catch (e) {
      print('Error fetching banner data: $e');
      _bannerSliders = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
