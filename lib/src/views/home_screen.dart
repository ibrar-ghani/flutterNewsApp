import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routingexample/src/views/news_screen.dart';
import 'package:routingexample/src/views/profile_page.dart';
import 'package:routingexample/src/controllers/news_controller.dart';
import 'package:routingexample/src/services/auth_service.dart'; // Import AuthService

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final NewsController newsController = Get.find<NewsController>();
  final AuthService _authService = AuthService(); // Create an instance of AuthService

  @override
  Widget build(BuildContext context) {
    // Fetch new articles each time the HomeScreen is built
    newsController.fetchData(query: 'technology', page: 1); // Adjust page number if needed

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'aboutUs',
                child: Text(
                  'About Us',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'contactUs',
                child: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'help',
                child: Text(
                  'Help',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'login',
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
            onSelected: (value) async {
              if (value == 'login') {
                await _authService.signOut(); // Sign out the user
                Get.offAllNamed('/login');
              } else {
                Get.toNamed('/$value');
              }
            },
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: NewsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              // Refresh HomeScreen to fetch new data
              Get.offAll(() => HomeScreen());
              break;
            case 1:
              Get.toNamed('search');
              break;
            case 2:
              Get.to(() => ProfilePage());
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blueAccent),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.blueAccent),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blueAccent),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
