import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
   const HelpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text('Help',      
        ),
        foregroundColor: Colors.white,
      backgroundColor: Colors.blueAccent,
      ),
      body:const Center(
        child: Text('Help Content Here',
        style: TextStyle(
          color: Colors.black,
        ),
        ),
      ),
    );
  }
}
