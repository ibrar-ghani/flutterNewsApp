import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routingexample/routes.dart';
class SignupScreen extends StatelessWidget {
   const SignupScreen({super.key});
  @override
   Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(title:const Text("Sign Up",
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
        child: const  Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Username',
            labelStyle: TextStyle(color: Colors.white),
            hintText: 'Enter your user name',
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
        child: const  Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Password',
             labelStyle: TextStyle(color: Colors.white),
            hintText: 'Enter your Password',
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
        child: const  Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Conform Password',
             labelStyle: TextStyle(color: Colors.white),
            hintText: 'Enter same Password',
             hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
         ),
        ),
          ),
       ),
      const SizedBox(height: 20),
        ElevatedButton(
          onPressed: (){
          Get.toNamed(home);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        child:const Text('Sign Up',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        ),
       
       const SizedBox(height: 20),
        TextButton(onPressed: ()
        {
             Get.toNamed(login);
        },
        child:const Text('Already have an account? Log In',
        style: TextStyle(
          color: Colors.red,
        ),
        ),
        ),
       ],
      ),
      ),
    );
   }
  }

