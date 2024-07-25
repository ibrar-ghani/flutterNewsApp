import 'package:flutter/material.dart';
import 'package:routingexample/src/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleCard extends StatelessWidget {
  final ArticleModel article;
  final String searchQuery;

  const ArticleCard({super.key, required this.article, required this.searchQuery});

  Future<void> _launchURL(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final url = article.url ?? 'https://flutter.dev';
        await _launchURL(context, url);
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _highlightText(article.title ?? '', searchQuery, isTitle: true),
              const SizedBox(height: 10),
              if (article.author != null) Text('Author: ${article.author!}'),
              if (article.publishedAt != null) Text('Published At: ${article.publishedAt!}'),
              if (article.source != null) Text('Source: ${article.source!.name ?? ''}'),
              const SizedBox(height: 10),
              _highlightText(article.description ?? '', searchQuery),
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
              _highlightText(article.content ?? '', searchQuery),
            ],
          ),
        ),
      ),
    );
  }

  Widget _highlightText(String text, String query, {bool isTitle = false}) {
    if (query.isEmpty || !text.toLowerCase().contains(query.toLowerCase())) {
      return Text(
        text,
        style: isTitle
            ? const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            : const TextStyle(fontSize: 16),
      );
    }

    final matches = <TextSpan>[];
    int start = 0;
    int index;
    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();

    while ((index = lowerText.indexOf(lowerQuery, start)) != -1) {
      if (index > start) {
        matches.add(TextSpan(
          text: text.substring(start, index),
          style: isTitle
              ? const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              : const TextStyle(fontSize: 16),
        ));
      }
      matches.add(TextSpan(
        text: text.substring(index, index + query.length),
        style: const TextStyle(
          backgroundColor: Colors.yellow,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ));
      start = index + query.length;
    }

    if (start < text.length) {
      matches.add(TextSpan(
        text: text.substring(start),
        style: isTitle
            ? const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            : const TextStyle(fontSize: 16),
      ));
    }

    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: isTitle ? 18 : 16),
        children: matches,
      ),
    );
  }
}
