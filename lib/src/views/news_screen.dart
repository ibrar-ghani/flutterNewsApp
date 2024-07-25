import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routingexample/src/controllers/news_controller.dart';
import 'package:routingexample/src/views/article_card.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});
  final NewsController newsController = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => newsController.newsData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newsController.newsData.length,
              itemBuilder: (context, index) {
                final newsItem = newsController.newsData[index];
                return ArticleCard(article: newsItem);
              },
            ),
    );
  }
}
