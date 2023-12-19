import 'package:get/get.dart';
import 'dart:io';
class ProfileController extends GetxController{
  RxString email=''.obs;
  Rx<File?> profilePicture = Rx<File?>(null);
  void setEmail(String value){
    email.value=value;
  }
  void setProfilePicture(File? file) {
    profilePicture.value = file;
  }

  File? getProfilePicture() {
    return profilePicture.value; // Use the null-aware operator
  }
}