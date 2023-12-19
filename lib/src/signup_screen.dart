import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:routingexample/routes.dart';
import 'package:logger/logger.dart';
import 'package:routingexample/src/home_screen.dart';
import 'package:routingexample/src/profilecontroller.dart';

class SignupScreen extends StatefulWidget {
   SignupScreen({super.key});
   final TextEditingController emailController = TextEditingController();
  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  final Logger _logger= Logger();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: 'Confirm your password',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  _logger.e('Before User Creation');
                  if (passwordController.text.trim() == confirmPasswordController.text.trim()) {
                    // Create a user using Firebase Authentication
                    final userCredential = await _auth.createUserWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                    ProfileController profileController = Get.put(ProfileController());
                    profileController.setEmail(emailController.text.trim());
                  _logger.e('After User Creation');
                    // Store user data in Firebase Realtime Database
                    // await storeUserData(userCredential.user!.uid, emailController.text.trim(), passwordController.text.trim());
                    _logger.e('After Storing User Data.');
                    emailController.clear();
                    passwordController.clear();
                    confirmPasswordController.clear();
                    // Navigate to the home screen after successful signup
                    Get.to(const HomeScreen());
                    showSnackbar('Signup successful!', Colors.green);
                  } else {
                    _logger.e('Passwords do not match');
                  }
                } catch (e) {
                  showSnackbar('Signup failed. $e', Colors.red);
                  _logger.e('Error: $e');
                
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Get.toNamed(login);
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


  Future<void> storeUserData(String userId, String email, String password) async {
    try {
      // Store user data under 'users' in the Realtime Database
       await _databaseReference.ref.child('users').child(userId).set({
        'email': email,
        'password': password,
        // Add more fields as needed
      });
    
    } catch (e) {
      _logger.e('Error storing user data: $e');
    }
  }
}
