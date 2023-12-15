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
  backgroundColor: Colors.indigo,
  appBar: AppBar(title:const Text('Log In',
  style: TextStyle(
    color: Colors.blueAccent,
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
        child:   Padding(
        padding:const EdgeInsets.all(8.0),
        child: TextField(
          controller: emailController,
          decoration:const InputDecoration(
            labelText: 'Username',
            labelStyle: TextStyle(color: Colors.white),
            hintText: 'Enter your Email',
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
        child:   Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: passwordController,
          decoration:const InputDecoration(
            labelText: 'Password',
            labelStyle:TextStyle( color: Colors.white),
            hintText: 'Enter your Password',
             hintStyle: TextStyle(color: Colors.white),
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
        Get.toNamed(home);
         }
           catch (e) {
             _logger.e('Error: $e');
         } 
          },
         style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
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
}
