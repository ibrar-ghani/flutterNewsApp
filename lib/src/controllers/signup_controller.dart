import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:routingexample/src/services/auth_service.dart';

class SignupController extends GetxController {
  final AuthService _authService = AuthService();
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController(text: '+1');
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  var isPasswordMatching = true.obs;

  @override
  void onInit() {
    super.onInit();
    confirmPasswordController.addListener(validatePasswords);
  }

  void validatePasswords() {
    isPasswordMatching.value =
        passwordController.text == confirmPasswordController.text;
  }

  Future<void> signup() async {
    try {
      if (isPasswordMatching.value) {
        User? user = await _authService.signUp(
          emailController.text.trim(),
          passwordController.text.trim(),
        );
        await _authService.storeUserData(
          user!.uid,
          emailController.text.trim(),
          nameController.text.trim(),
          '${countryCodeController.text.trim()}${phoneNumberController.text.trim()}',
          addressController.text.trim(),
        );
        clearFields();
        Get.offAllNamed('home');
        showSnackbar('Signup successful!', Colors.green);
      } else {
        showSnackbar('Passwords do not match', Colors.red);
      }
    } catch (e) {
      showSnackbar('Signup failed. $e', Colors.red);
    }
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    nameController.clear();
    countryCodeController.clear();
    phoneNumberController.clear();
    addressController.clear();
  }

  void showSnackbar(String message, Color color) {
    Get.snackbar(
      'Signup Status',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
