import 'package:flutter/material.dart';
import 'package:routingexample/src/news_controller.dart';
import 'package:routingexample/src/news_model.dart';
import 'package:get/get.dart';

 class NewsScreen extends StatelessWidget
 {
          NewsScreen({super.key});
  final NewsController newsController = Get.find<NewsController>();
    @override
          Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: newsController.newsData.length,
        itemBuilder: (context, index) {
          final newsItem = newsController.newsData[index];
          return ArticleCard(article: newsItem);
        },
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final ArticleModel article;
 const ArticleCard({Key? key, required this.article}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title ?? ''),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article.author != null) Text('Author: ${article.author!}'),
          if (article.publishedAt != null) Text('Published At: ${article.publishedAt!}'),
          if (article.source != null) Text('Source: ${article.source!.name ?? ''}'),
          Text(article.description ?? ''),
          const SizedBox(height: 8.0),
          if (article.urlToImage != null)
            Image.network(
              article.urlToImage!,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          const SizedBox(height: 8.0),
          Text(
            article.content ?? '',
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
