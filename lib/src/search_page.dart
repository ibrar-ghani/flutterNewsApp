// search_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routingexample/src/news_controller.dart';
import 'package:routingexample/src/news_model.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final NewsController newsController = Get.put(NewsController());
  final TextEditingController searchController = TextEditingController();

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
              controller: searchController,
              onChanged: (query) {
                // Handle the search query here
                newsController.fetchData(query: query);
              },
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
