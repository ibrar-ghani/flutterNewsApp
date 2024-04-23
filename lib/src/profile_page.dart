import 'package:flutter/material.dart';
import 'package:routingexample/src/profile_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

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
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //profile picture
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: profileController.profilePicture.value?.path != null
                    ? FileImage(profileController.profilePicture.value!) as ImageProvider<Object>?
                    : const AssetImage('assets/human-icon-png-1901.png'),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => Text('Email: ${profileController.email}')),
            Obx(() => Text('Name: ${profileController.name}')),
            Obx(() => Text('Phone Number: ${profileController.phoneNumber}')),
            Obx(() => Text('Address: ${profileController.address}')),
          ],
        ),
      ),
    );
  }
}

