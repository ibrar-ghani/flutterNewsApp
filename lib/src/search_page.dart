// search_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routingexample/src/news_controller.dart';
import 'package:routingexample/src/news_model.dart';

class SearchPage extends StatelessWidget {
     SearchPage ({super.key});
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: newsController.updateQuery,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter your search query',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                final searchResults = newsController.newsData;
                return searchResults.isNotEmpty
                    ? ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          final result = searchResults[index];
                          return ArticleCard(article: result);
                        },
                      )
                    : const Center(
                        child: Text('No results to display'),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final ArticleModel article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title ?? ''),
      subtitle: Column(
        children: [
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
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
