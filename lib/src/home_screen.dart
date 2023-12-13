import 'package:flutter/material.dart';
import 'package:routingexample/src/news_screen.dart';
import 'package:get/get.dart';
import 'package:routingexample/src/profile_page.dart';
class HomeScreen extends StatelessWidget{
   // const HomeScreen({Key? key}) : super(key: key);
@override
Widget build (BuildContext context){
  return Scaffold(
    appBar: AppBar(title:const Text('Home'),
    actions: [
      PopupMenuButton(
        itemBuilder: (BuildContext context) =>[
        const  PopupMenuItem <String>(
            value:'aboutUs',
            child: Text('About Us'),
            ),
            const  PopupMenuItem <String>(
            value:'contactUs',
            child: Text('Contact Us'),
            ),
            const  PopupMenuItem <String>(
            value:'help',
            child: Text('Help'),
            ),
        ],
        onSelected: (value) {
          //Handle menu item using getx
          Get.toNamed('/$value');
        },
        
        )
    ],
    ),
     body:  NewsScreen(),
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: 0,
     onTap:(index) {
      switch(index){
     case 0:
     Get.offAll(()=>  HomeScreen());
     break;
     case 1:
      Get.toNamed('search');
      break;
      case 2:
      Get.to(()=>  ProfilePage());
      break;
     }
     },
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
        ),
    ],
    ),
  );
}
}