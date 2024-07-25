import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routingexample/src/controllers/news_controller.dart';
import 'package:routingexample/src/views/article_card.dart';

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
