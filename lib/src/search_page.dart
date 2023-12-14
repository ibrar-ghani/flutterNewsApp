import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  List<Map<String,dynamic>> searchResults = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Search Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) {
                // Call a function to update search results based on the query
                updateSearchResults(query);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter your search query',
                prefixIcon:const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final result=searchResults[index];
                return ListTile(
                  title: Text(result['title']),
                  subtitle: Text(result['description']),
                  // Add additional details or actions as needed
                );
              },
            ),
          ),
        ],
      ),
    );
  }

 // Function to update search results based on the query using an API
  Future<void> updateSearchResults(String query) async {
    // Replace 'your_api_key_here' with your actual API key
    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/everything?q=bitcoin&apiKey=06d5928e7e9c42939b110b9ab671e75a'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['status'] == 'ok') {
        final List<dynamic> articles = responseData['articles'];
        setState(() {
          searchResults = articles.cast<Map<String, dynamic>>();
        });
      } else {
        throw Exception('API returned an error: ${responseData['message']}');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}