import 'package:get/get.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class ProfileController extends GetxController {
  RxString email = ''.obs;
  RxString name = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString address = ''.obs;
  Rx<File?> profilePicture = Rx<File?>(null);
  final Logger _logger = Logger();

  User? get user => FirebaseAuth.instance.currentUser;

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

  void setProfilePicture(File? file) {
    profilePicture.value = file;
  }

  File? getProfilePicture() {
    return profilePicture.value;
  }

  Future<void> fetchUserData() async {
    try {
      if (user != null) {
        setEmail(user!.email ?? '');
        setName(user!.displayName ?? '');
      }
    } catch (error) {
      _logger.e('Error fetching user data: $error');
    }
  }

  Future<void> fetchAdditionalUserData() async {
    try {
      if (user != null) {
        final DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(user!.uid)
                .get();

        if (snapshot.exists) {
          setPhoneNumber(snapshot.data()?['phoneNumber'] ?? '');
          setAddress(snapshot.data()?['address'] ?? '');
        }
      }
    } catch (error) {
      _logger.e('Error fetching additional user data: $error');
    }
  }
}
