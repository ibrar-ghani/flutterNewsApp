import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routingexample/src/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Log In',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller.emailController,
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
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      controller: controller.passwordController,
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Get.toNamed('signup');
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
