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
import 'package:firebase_core/firebase_core.dart';
import 'package:routingexample/firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  //  options:const FirebaseOptions(
   // apiKey: 'AIzaSyBHj0LYCNPNnv2oTv6sb-j8SGR3LbiIJB4',
   // appId: '1:961617701989:web:76ca4931c37aa3f4b26a8c',
   // messagingSenderId: '961617701989',
   // projectId: 'news-app-b18b9',
   // authDomain: 'news-app-b18b9.firebaseapp.com',
   // storageBucket: 'news-app-b18b9.appspot.com',
 // ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      initialRoute: login,
      getPages: [
        GetPage(name: login, page: () =>const LoginScreen()),
        GetPage(name: signup, page: () =>const  SignupScreen()),
        GetPage(name: home, page: () => const  HomeScreen()),
        GetPage(name: search, page: ()=> const SearchPage()),
        GetPage(name: profile, page: ()=> const  ProfilePage()),
        GetPage(name: about, page: ()=> const AboutUsScreen()),
        GetPage(name: contact, page: ()=> const  ContactUsScreen()),
        GetPage(name: help, page: ()=> const HelpScreen()),
      ],
    );
  }
}
