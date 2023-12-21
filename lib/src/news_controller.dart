// news_controller.dart
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:routingexample/src/news_model.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class NewsController extends GetxController {
  var newsData = <ArticleModel>[].obs;
  final Logger _logger = Logger();
  final _queryController = BehaviorSubject<String>();

  @override
  void onInit() {
    super.onInit();
    _queryController
        .debounceTime(const Duration(milliseconds: 300))
        .listen((query) {
      fetchData(query: query);
    });
  }

  void clearData() {
    newsData.clear();
  }

  void updateQuery(String query) {
    _queryController.add(query);
  }

  Future<void> fetchData({required String query}) async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/everything?q=bitcoin&apiKey=06d5928e7e9c42939b110b9ab671e75a'));

      if (response.statusCode == 200) {
        final contentType = response.headers['content-type'];
        if (contentType != null && contentType.contains('application/json')) {
          final Map<String, dynamic> responseData =
              json.decode(response.body);
          if (responseData['status'] == 'ok') {
            final List<dynamic> articles = responseData['articles'];
            newsData.assignAll(
                articles.map((json) => ArticleModel.fromJson(json)).toList());
          } else {
            throw Exception(
                'API returned an error: ${responseData['message']}');
          }
        } else {
          throw Exception('Invalid content type: $contentType');
        }
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      _logger.e('Error: $error');
    }
  }
}
