// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';
import 'package:routingexample/src/signup_screen.dart';
import 'package:routingexample/src/login_screen.dart';
import 'package:routingexample/src/home_screen.dart';
import 'package:routingexample/src/profile_page.dart';
import 'package:routingexample/src/Search_Page.dart';
import 'package:routingexample/src/about_us.dart';
import 'package:routingexample/src/contact_us.dart';
import 'package:routingexample/src/help.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Routing Exp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: login,
      getPages: [
        GetPage(name: login, page: () => LoginScreen()),
        GetPage(name: signup, page: () =>  SignupScreen()),
        GetPage(name: home, page: () =>   HomeScreen()),
        GetPage(name: search, page: ()=> SearchPage()),
        GetPage(name: profile, page: ()=> ProfilePage()),
        GetPage(name: about, page: ()=> AboutUsScreen()),
        GetPage(name: contact, page: ()=>  ContactUsScreen()),
        GetPage(name: help, page: ()=> HelpScreen()),
      ],
    );
  }
}
