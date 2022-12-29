import 'package:final_project_kel_4/view/home_screen.dart';
import 'package:final_project_kel_4/view/user_profile.dart';
import 'package:final_project_kel_4/view/wishlist_screen.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final List widgetOptions = const [
    MenuPage(),
    WishlistScreen(),
    UserProfile()
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white60,
          // currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 32,
                  color: Color(0xffFFA45B),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 32,
                  color: Color(0xffFFA45B),
                ),
                label: 'Wishlist'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 32,
                  color: Color(0xffFFA45B),
                ),
                label: 'Account'),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: const Color(0xffFFA45B),
          selectedItemColor: const Color.fromARGB(255, 218, 119, 37),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
