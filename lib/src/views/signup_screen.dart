import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routingexample/src/services/auth_service.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final AuthService _authService = AuthService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Enter your name',
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: phoneNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Phone',
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Enter your Phone number',
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Confirm your password',
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: addressController,
                        decoration: const InputDecoration(
                          labelText: 'Address',
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Enter your current address',
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () async {
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
                        emailController.clear();
                        passwordController.clear();
                        confirmPasswordController.clear();
                        nameController.clear();
                        phoneNumberController.clear();
                        addressController.clear();
                        Get.offAllNamed('home');
                        showSnackbar('Signup successful!', Colors.green);
                      } else {
                        showSnackbar('Passwords do not match', Colors.red);
                      }
                    } catch (e) {
                      showSnackbar('Signup failed. $e', Colors.red);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    Get.toNamed('login');
                  },
                  child: const Text(
                    'Already have an account? Log In',
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
}
