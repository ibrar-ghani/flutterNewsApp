// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/services/routes.dart';
import 'package:routingexample/src/views/splash_screen.dart';
import 'package:routingexample/src/views/signup_screen.dart';
import 'package:routingexample/src/views/login_screen.dart';
import 'package:routingexample/src/views/home_screen.dart';
import 'package:routingexample/src/views/profile_page.dart';
import 'package:routingexample/src/views/Search_Page.dart';
import 'package:routingexample/src/views/about_us.dart';
import 'package:routingexample/src/views/contact_us.dart';
import 'package:routingexample/src/views/help.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:routingexample/src/services/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
      initialRoute: splashscreen,
      getPages: [
        GetPage(name: splashscreen, page: () => const SplashScreen()),
        GetPage(name: login, page: () =>const LoginScreen()),
        GetPage(name: signup, page: () =>  const SignupScreen()),
        GetPage(name: home, page: () =>  HomeScreen()),
        GetPage(name: search, page: ()=>  SearchPage()),
        GetPage(name: profile, page: ()=>  ProfilePage()),
        GetPage(name: about, page: ()=> const AboutUsScreen()),
        GetPage(name: contact, page: ()=> const  ContactUsScreen()),
        GetPage(name: help, page: ()=> const HelpScreen()),
      ],
    );
  }
}
