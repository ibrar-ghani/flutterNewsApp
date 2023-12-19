import 'package:flutter/material.dart';
import 'package:routingexample/src/profilecontroller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final ProfileController profileController = Get.put(ProfileController());
  
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Update the profile picture with the selected image
      profileController.setProfilePicture(File(pickedFile.path));
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //profile picture
          //  GestureDetector(
          //  onTap: _pickImage,
          // child: CircleAvatar(
          // radius: 50.0,
          // backgroundImage: profileController.profilePicture.value != null
          // ? FileImage(profileController.profilePicture.value.value)
          // : Image.network('assets/human-icon-png-1901.png').image,
          //      ),
          // ),


          const  SizedBox(height: 16),
            Obx(() => Text('Email: ${profileController.email}')),
            // Add other details if needed
          ],
        ),
      ),
    );
  }
}
