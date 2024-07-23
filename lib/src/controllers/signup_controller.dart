import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routingexample/src/services/auth_service.dart';

class SignupController extends GetxController {
  final AuthService _authService = AuthService();
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<void> signup() async {
    try {
      if (passwordController.text.trim() == confirmPasswordController.text.trim()) {
        User? user = await _authService.signUp(
          emailController.text.trim(),
          passwordController.text.trim(),
        );
        await _authService.storeUserData(
          user!.uid,
          emailController.text.trim(),
          nameController.text.trim(),
          phoneNumberController.text.trim(),
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
    phoneNumberController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
