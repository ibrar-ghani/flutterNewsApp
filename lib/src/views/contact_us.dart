import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
   const ContactUsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Contact Us'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      body:const Center(
        child: Text('Contact Us Screen Content'),
      ),
    );
  }
}
