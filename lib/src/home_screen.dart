import 'package:flutter/material.dart';
import 'package:routingexample/src/news_screen.dart';
import 'package:get/get.dart';
import 'package:routingexample/src/profile_page.dart';
class HomeScreen extends StatelessWidget{
   const HomeScreen({super.key});
@override
Widget build (BuildContext context){
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,

      title:const Text('Home',
      style: TextStyle(
        color: Colors.white,
      ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    actions: [
      PopupMenuButton(
        itemBuilder: (BuildContext context) =>[
        const  PopupMenuItem <String>(
            value:'aboutUs',
            child: Text('About Us',
            style: TextStyle(color: Colors.blueAccent),
            ),
            ),
            const  PopupMenuItem <String>(
            value:'contactUs',
            child: Text('Contact Us',
            style: TextStyle(color: Colors.blueAccent),
            ),
            ),
            const  PopupMenuItem <String>(
            value:'help',
            child: Text('Help',
            style: TextStyle(color: Colors.blueAccent),
            ),
            ),
            const PopupMenuItem <String>(
              value: 'login',
              child: Text('LogOut',
              style: TextStyle(color: Colors.red),
              ),
            ),
        ],
        onSelected: (value) {
          //Handle menu item using getx
          Get.toNamed('/$value');
        },
        
        )
    ],
    backgroundColor: Colors.blueAccent,
    ),
     body:  NewsScreen(),
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: 0,
     onTap:(index) {
      switch(index){
     case 0:
     Get.offAll(()=>  const HomeScreen());
     break;
     case 1:
      Get.toNamed('search');
      break;
      case 2:
      Get.to(()=>   ProfilePage());
      break;
     }
     },
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home,color: Colors.blueAccent),
        label: 'Home',
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.search,color: Colors.blueAccent),
        label: 'Search',
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.person,color: Colors.blueAccent),
        label: 'Profile',
        ),
    ],
    ),
  );
}
}