import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routingexample/src/services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    try {
      await _authService.signIn(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      emailController.clear();
      passwordController.clear();
      showSnackbar('Login successful!', Colors.green);
      Get.offAllNamed('home');
    } catch (e) {
      showSnackbar('Login failed. $e', Colors.red);
    }
  }

  void showSnackbar(String message, Color color) {
    Get.snackbar(
      'LogIn Status',
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
    super.onClose();
  }
}
