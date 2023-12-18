import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
      final response= await http.get(Uri.parse('https://newsapi.org/v2/everything?q=bitcoin&apiKey=06d5928e7e9c42939b110b9ab671e75a'));
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
          title: Text(newsItem['title']??''),
          subtitle: Column(
            children: [
              Text(newsItem['description']??''),
            const  SizedBox(height: 8.0),
            if ( newsItem['ImageUrl']!=null )
              Image.network(
                newsItem['ImageUrl'],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
             const SizedBox(height: 8.0),
              Text(
                newsItem['content'] ??'',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          
          //Add other widget to display more details if needed 
        );
      },
    );
  }
}