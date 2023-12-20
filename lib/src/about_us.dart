import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('About Us'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      body:const Center(
        child: Text('Include All the Details about the news App'),
      ),
    );
  }
}
