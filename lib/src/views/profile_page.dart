import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:routingexample/src/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Upload the profile picture and update the profile picture URL
      await profileController.uploadProfilePicture(File(pickedFile.path));
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
      body: Obx(() {
        if (profileController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile picture
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 150.0,
                    backgroundImage: profileController.profilePictureUrl.isNotEmpty
                        ? NetworkImage(profileController.profilePictureUrl.value) as ImageProvider<Object>?
                        : const AssetImage('assets/human-icon-png-1901.png'),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Email: ${profileController.email}'),
                Text('Name: ${profileController.name}'),
                Text('Phone Number: ${profileController.phoneNumber}'),
                Text('Address: ${profileController.address}'),
              ],
            ),
          ),
        );
      }),
    );
  }
}
