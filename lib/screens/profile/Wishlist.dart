import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:register_login/screens/profile/page1.dart';

class wishlist extends StatefulWidget {
  const wishlist({super.key});

  @override
  State<wishlist> createState() => _page2State();
}

class _page2State extends State<wishlist> {
  @override
  Widget build(BuildContext context) {
    final urlimage =
        'https://images.unsplash.com/photo-1503235930437-8c6293ba41f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80';
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        backgroundColor: Color(0xffFBF6F0),
        elevation: 0.0,
        title: const Text('My Wishlist!'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => page1()));
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                    width: 200,
                    height: 160,
                    child: FittedBox(
                      child: Image.network(
                        urlimage,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text("Baju Baru"),
                Text("Rp 50.000,00"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => page1()));
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                    width: 200,
                    height: 160,
                    child: FittedBox(
                      child: Image.network(
                        urlimage,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text("Baju Baru"),
                Text("Rp 50.000,00"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => page1()));
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                    width: 200,
                    height: 160,
                    child: FittedBox(
                      child: Image.network(
                        urlimage,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text("Baju Baru"),
                Text("Rp 50.000,00"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
