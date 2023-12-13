import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
   //const ProfilePage({super.key});
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //profile picture
          const  CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('asset/profile_image.jpg'),
            ),
           const SizedBox(height: 16.0),
            //Username
          const  Text(
              'XYZ@123',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
           const  SizedBox(height: 8.0),
            //Name
         const   Text(
              'ABCDEFG',
              style: TextStyle(fontSize: 16),
            ),
          const  SizedBox(height: 16),
            _buildDetailRow('Email:','ABCXYZ@gmail.com'),
            _buildDetailRow('location:','City, Country'),
            _buildDetailRow('Join Date:','Jan 1, 2022'),
          ],
        ),
        ),
    );
  }
  Widget _buildDetailRow (String label, String value)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
        style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}