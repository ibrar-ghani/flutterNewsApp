import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
   const HelpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:const Text('Help',      
        ),
        foregroundColor: Colors.white,
      backgroundColor: Colors.blueAccent,
      ),
      body:const Center(
        child: Text('1. How do I navigate through the app?'
                     'To navigate through the App,'
                    ' use the bottom navigation bar.'
                    ' You can switch between different sections'
                    ' such as Home, Search, and Profile.',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}
