import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routingexample/src/news_controller.dart';
import 'package:routingexample/src/news_model.dart';

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

class ArticleCard extends StatelessWidget {
  final ArticleModel article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (article.author != null) Text('Author: ${article.author!}'),
            if (article.publishedAt != null) Text('Published At: ${article.publishedAt!}'),
            if (article.source != null) Text('Source: ${article.source!.name ?? ''}'),
            const SizedBox(height: 10),
            Text(article.description ?? ''),
            const SizedBox(height: 10),
            if (article.urlToImage != null)
              Image.network(
                article.urlToImage!,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: Text('Image not available'),
                    ),
                  );
                },
              ),
            const SizedBox(height: 10),
            Text(
              article.content ?? '',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
