// news_controller.dart
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:routingexample/src/news_model.dart';
import 'package:logger/logger.dart';

class NewsController extends GetxController {
  var newsData = <ArticleModel>[].obs;
  final Logger _logger = Logger();

  void clearData() {
    newsData.clear();
  }

  Future<void> fetchData({String query = ''}) async {
    try {
      final response = await http.get(
        Uri.parse('https://newsapi.org/v2/everything?q=$query&apiKey=06d5928e7e9c42939b110b9ab671e75a'),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['status'] == 'ok') {
          final List<dynamic> articles = responseData['articles'];
          newsData.assignAll(articles.map((json) => ArticleModel.fromJson(json)).toList());
        } else {
          throw Exception('API returned an error: ${responseData['message']}');
        }
      } else {
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      _logger.e('Error fetching data: $error');
      throw Exception('Failed to fetch data. Please try again later.');
    }
  }
}
