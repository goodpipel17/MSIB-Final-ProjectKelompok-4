import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class adminui extends StatefulWidget {
  const adminui({super.key});

  @override
  State<adminui> createState() => _adminuiState();
}

class _adminuiState extends State<adminui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        backgroundColor: Color(0xffFBF6F0),
        elevation: 0.0,
        title: const Text('Hello Admin'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
