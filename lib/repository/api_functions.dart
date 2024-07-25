import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machinetask_wac/models/category_model.dart';
import 'package:machinetask_wac/models/most_popular.dart';
import 'package:machinetask_wac/models/single_banner.dart';
import 'package:machinetask_wac/models/slider_banner_model.dart';

class ApiService {
  final String _baseUrl =
      'https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo';

  Future<List<BannerContent>> fetchBannerSliders() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => BannerContent.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load banner sliders');
      }
    } catch (error) {
      throw Exception('Failed to load banner sliders: $error');
    }
  }

  Future<SingleBanner?> fetchSingleBanner() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final singleBannerData = data.firstWhere(
            (item) => item['type'] == 'banner_single',
            orElse: () => null);

        if (singleBannerData != null) {
          return SingleBanner.fromJson(singleBannerData);
        } else {
          throw Exception('Single banner not found');
        }
      } else {
        throw Exception('Failed to load single banner');
      }
    } catch (error) {
      throw Exception('Failed to load single banner: $error');
    }
  }

  Future<List<Category>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        final categories = data
            .where((item) => item['type'] == 'catagories')
            .expand((item) => (item['contents'] as List)
                .map((content) => Category.fromJson(content)))
            .toList();
        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      throw error;
    }
  }

  Future<List<Product>> fetchMostPopularProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<Product> products = data
            .where((item) =>
                item['type'] == 'products' && item['title'] == 'Most Popular')
            .expand((item) => item['contents'])
            .map((json) => Product.fromJson(json))
            .toList();

        return products;
      } else {
        throw Exception('Failed to load most popular products');
      }
    } catch (error) {
      throw Exception('Failed to load most popular products: $error');
    }
  }

  Future<List<Product>> fetchBestSellersProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      print('😊😊😊${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<Product> products = data
            .where((item) =>
                item['type'] == 'products' && item['title'] == 'Best Sellers')
            .expand((item) => item['contents'])
            .map((json) => Product.fromJson(json))
            .toList();

        return products;
      } else {
        throw Exception('Failed to load best sellers products');
      }
    } catch (error) {
      throw Exception('Failed to load best sellers products: $error');
    }
  }
}
