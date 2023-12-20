import 'package:get/get.dart';
import 'dart:io';
class ProfileController extends GetxController{
  RxString email=''.obs;
  RxString name = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString address = ''.obs;
  Rx<File?> profilePicture = Rx<File?>(null);
  void setEmail(String value){
    email.value=value;
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
    return profilePicture.value; // Use the null-aware operator
  }
}