import 'package:get/get.dart';
import 'package:routingexample/routes.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget{
  // const LoginScreen({super.key});
@override
Widget build(BuildContext context){
 return Scaffold(
  appBar: AppBar(title:const Text('Log In')),
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
        ElevatedButton(onPressed: () {
        Get.toNamed(home);
        },
        child:const Text("LogIn"),
        ),
       const SizedBox(height: 20),
       TextButton(onPressed: ()
       {
       Get.toNamed(signup);
       },
       child:const Text("Don't have an account? Sign Up"),
       ),
      ],
    ),
  ),
 );
}
}
