import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  //const AboutUsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('About Us'),
      ),
      body:const Center(
        child: Text('Include All the Details about the news App'),
      ),
    );
  }
}
