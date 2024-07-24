// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Check the authentication status
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // Navigate to login screen if user is not authenticated
        Get.offAllNamed('/login');
      } else {
        // Navigate to home screen if user is authenticated
        Get.offAllNamed('/home');
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
