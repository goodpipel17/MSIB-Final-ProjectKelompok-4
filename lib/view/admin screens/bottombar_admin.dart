import 'package:final_project_kel_4/view/admin%20screens/Home_admin.dart';
import 'package:final_project_kel_4/view/admin%20screens/create_product_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomBarAdmin extends StatefulWidget {
  const BottomBarAdmin({super.key});

  @override
  State<BottomBarAdmin> createState() => _BottomBarAdminState();
}

class _BottomBarAdminState extends State<BottomBarAdmin> {
  final List widgetOptions = const [
    HomeAdmin(),
    ProductAdmin(),
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
                label: 'Beranda'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_basket,
                  size: 32,
                  color: Color(0xffFFA45B),
                ),
                label: 'Produk'),
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
