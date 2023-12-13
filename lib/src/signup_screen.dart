import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routingexample/routes.dart';
class SignupScreen extends StatelessWidget {
   //const SignupScreen({Key? key}) : super(key: key);
  @override
   Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:const Text("Sign Up")),
      body: Center(
      child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
       Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
        child: const  Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Username',
            hintText: 'Enter your user name',
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
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
        child: const  Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your Password',
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
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
        child: const  Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Conform Password',
            hintText: 'Enter same Password',
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
        
        child:const Text('Sign Up'),
        ),
       
       const SizedBox(height: 20),
        TextButton(onPressed: ()
        {
             Get.toNamed(login);
        },
        child:const Text('Already have an account? Log In'),
        ),
       ],
      ),
      ),
    );
   }
  }

