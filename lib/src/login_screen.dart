import 'package:get/get.dart';
import 'package:routingexample/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});
  @override
  LoginScreenState createState()=> LoginScreenState();
}
class LoginScreenState extends State<LoginScreen>{
  final FirebaseAuth _auth =FirebaseAuth.instance;
  late TextEditingController passwordController=TextEditingController();
  late TextEditingController emailController=TextEditingController();
  final Logger _logger= Logger();
@override
Widget build(BuildContext context){
 return Scaffold(
  backgroundColor: Colors.white,
  appBar: AppBar(
    automaticallyImplyLeading: false,
    title:const Text('Log In',
  style: TextStyle(
    color: Colors.white,
  ),
  ),
  backgroundColor: Colors.blueAccent,
  ),
  body: Center(
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
        child:   Padding(
        padding:const EdgeInsets.all(8.0),
        child: TextField(
          controller: emailController,
          decoration:const InputDecoration(
            labelText: 'Username',
            labelStyle: TextStyle(color: Colors.black),
            hintText: 'Enter your Email',
            hintStyle: TextStyle(color: Colors.blueAccent),
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
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(8.0),
          ),
        child:   Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          obscureText: true,
          controller: passwordController,
          decoration:const InputDecoration(
            labelText: 'Password',
            labelStyle:TextStyle( color: Colors.black),
            hintText: 'Enter your Password',
             hintStyle: TextStyle(color: Colors.blueAccent),
            border: InputBorder.none,
          ),
         ),
        ),
        ),
       ),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: () 
        async{
          try{
            await _auth.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
          emailController.clear();
          passwordController.clear();
          showSnackbar('Login successful!', Colors.greenAccent);
          Get.offAllNamed('home');
         }
           catch (e) {
          showSnackbar('Login failed. $e', Colors.red);
             _logger.e('Error: $e');
         } 
          },
         style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
        ),
        child:const Text("LogIn",
        style: TextStyle(
            color: Colors.white,
        ),
        ),
        ),
       const SizedBox(height: 20),
       TextButton(onPressed: ()
      {
       Get.toNamed(signup);
       },
       child:const Text("Don't have an account? Sign Up",
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
    'LogIn Status',
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: color,
    colorText: Colors.white,
    duration: const Duration(seconds: 3),
  );
}
}
