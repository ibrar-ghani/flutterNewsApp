import 'package:get/get.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';

class ProfileController extends GetxController {
  RxString email = ''.obs;
  RxString name = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString address = ''.obs;
  RxString profilePictureUrl = ''.obs;
  RxBool isLoading = false.obs; // Add a loading state
  final Logger _logger = Logger();

  User? get user => FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
    fetchAdditionalUserData();
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setName(String value) {
    name.value = value;
  }

  void setPhoneNumber(String value) {
    phoneNumber.value = value;
  }

  void setAddress(String value) {
    address.value = value;
  }

  void setProfilePictureUrl(String url) {
    profilePictureUrl.value = url;
  }

  Future<void> fetchUserData() async {
    try {
      isLoading.value = true;
      if (user != null) {
        _logger.i('Fetching user data for email: ${user!.email}');
        setEmail(user!.email ?? '');
      } else {
        _logger.e('User is not authenticated');
      }
    } catch (error) {
      _logger.e('Error fetching user data: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchAdditionalUserData() async {
    try {
      isLoading.value = true;
      if (user != null) {
        final DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(user!.uid)
                .get();

        if (snapshot.exists) {
          _logger.i('Fetched additional user data: ${snapshot.data()}');
          setName(snapshot.data()?['name'] ?? '');
          setPhoneNumber(snapshot.data()?['phoneNumber'] ?? '');
          setAddress(snapshot.data()?['address'] ?? '');
          setProfilePictureUrl(snapshot.data()?['profilePictureUrl'] ?? '');
          _logger.i('Profile picture URL: ${profilePictureUrl.value}');
        } else {
          _logger.e('No user document found in Firestore');
        }
      } else {
        _logger.e('User is not authenticated');
      }
    } catch (error) {
      _logger.e('Error fetching additional user data: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> uploadProfilePicture(File file) async {
    try {
      isLoading.value = true;
      if (user != null) {
        // Verify the file exists before attempting to upload
        if (!await file.exists()) {
          _logger.e('File does not exist at path: ${file.path}');
          throw Exception('File does not exist');
        }

        // Reference to Firebase Storage
        final storageRef = FirebaseStorage.instance.ref();
        final profilePicRef = storageRef.child('profile_pictures/${user!.uid}.jpg');

        _logger.i('Uploading file to: ${profilePicRef.fullPath}');

        // Upload task
        final uploadTask = profilePicRef.putFile(file);

        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          _logger.i('Upload progress: ${snapshot.bytesTransferred}/${snapshot.totalBytes}');
        });

        final snapshot = await uploadTask.whenComplete(() {
          _logger.i('Upload completed');
        });

        if (snapshot.state == TaskState.success) {
          _logger.i('Upload successful');
          final downloadUrl = await snapshot.ref.getDownloadURL();
          _logger.i('Download URL: $downloadUrl');

          // Update Firestore with the new URL
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .update({'profilePictureUrl': downloadUrl});

          setProfilePictureUrl(downloadUrl);
        } else {
          _logger.e('Upload failed with state: ${snapshot.state}');
          throw Exception('Upload failed with state: ${snapshot.state}');
        }
      } else {
        _logger.e('User is not authenticated');
        throw Exception('User is not authenticated');
      }
    } catch (error) {
      _logger.e('Error during upload: $error');
      throw Exception('Error during upload: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
