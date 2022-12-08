import 'package:flutter/material.dart';

class CategoryAdmin extends StatelessWidget {
  const CategoryAdmin(int i, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Text("Hi, admin!",
            style: TextStyle(fontSize: 16, color: Colors.black)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
    );
  }
}
