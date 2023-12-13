import 'package:flutter/material.dart';
class NewsScreen extends StatelessWidget{
//const NewsScreen({super.key});

@override
Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Adjust the number of cards as needed
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('News Title $index'),
            subtitle: Text('News Content $index'),
            onTap: () {
              // Handle card tap if needed
            },
          ),
        );
      },
    );
  }
}