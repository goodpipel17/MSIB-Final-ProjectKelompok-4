import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:register_login/screens/home/home_screen.dart';

import '../profile/Profile.dart';
import '../profile/page1.dart';
import '../profile/page2.dart';

class bottom_bar extends StatefulWidget {
  const bottom_bar({super.key});

  @override
  State<bottom_bar> createState() => _bottom_barState();
}

class _bottom_barState extends State<bottom_bar> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          const HomeScreen(),
          const HomeScreen(),
          const HomeScreen(),
          const Profile(),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        backgroundColor: const Color(0xffFBF6F0),
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: const <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            inactiveColor: Colors.black87,
            activeColor: Color(0xffFFA45B),
          ),
          BottomBarItem(
            icon: Icon(Icons.poll_rounded),
            title: Text('Products'),
            inactiveColor: Colors.black87,
            activeColor: Color(0xffFFA45B),
          ),
          BottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
            inactiveColor: Colors.black87,
            activeColor: Color(0xffFFA45B),
          ),
          BottomBarItem(
            title: Text('Account'),
            icon: Icon(Icons.person),
            inactiveColor: Colors.black87,
            activeColor: Color(0xffFFA45B),
          ),
        ],
      ),
    );
  }
}
