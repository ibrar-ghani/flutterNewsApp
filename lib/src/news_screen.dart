import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:routingexample/api_key.dart';
class NewsScreen extends StatefulWidget{
  const NewsScreen({super.key});
@override
      NewsScreenState createState()=> NewsScreenState();
}
 class NewsScreenState extends State <NewsScreen>
 {
    List<Map<String,dynamic>> newsData=[];
    @override
    void initState()
    {
      super.initState();
      fetchData();
    }
    Future <void> fetchData() async{
      const apiKey=newsApiKey;
      final response= await http.get(Uri.parse('https://newsdata.io/api/1/news?apikey=$apiKey'));
      if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['status']=='ok')
      {
        final List<dynamic> articles= responseData['articles'];
        setState(() {
          newsData= articles.cast< Map<String, dynamic>>();
        });
      }
      else{
             throw Exception('API returned an error: ${responseData['message']}');
      }  
    }
    else {
    throw Exception('Failed to load data');
       }
  }
  @override
Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsData.length, // Adjust the number of cards as needed
      itemBuilder: (context, index) {
        final newsItem= newsData[index];
        return ListTile(
          title: Text(newsItem['title']),
          subtitle: Text(newsItem['description']),
          //Add other widget to display more details if needed 
        );
      },
    );
  }
}