import 'package:flutter/material.dart';
import 'package:routingexample/src/news_controller.dart';
import 'package:get/get.dart';

 class NewsScreen extends StatelessWidget
 {
          NewsScreen({super.key});
  final NewsController newsController = Get.put(NewsController());
    @override
Widget build(BuildContext context) {
   return Obx(
      () => ListView.builder(
        itemCount: newsController.newsData.length,
        itemBuilder: (context, index) {
          final newsItem = newsController.newsData[index];
          return ListTile(
            title: Text(newsItem.title ?? ''),
            subtitle: Column(
              children: [
                Text(newsItem.description ?? ''),
                const SizedBox(height: 8.0),
                if (newsItem.urlToImage != null && newsItem.urlToImage!.isNotEmpty)
                  Image.network(
                    newsItem.urlToImage!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                const SizedBox(height: 8.0),
                Text(
                  newsItem.content ?? '',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}