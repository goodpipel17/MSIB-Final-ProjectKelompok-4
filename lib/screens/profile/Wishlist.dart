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
        'https://plus.unsplash.com/premium_photo-1669703777692-0289d224bcc7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8ZmFzaGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60';

    final urlimagewish =
        "https://media.istockphoto.com/id/1333434618/id/foto/wanita-muda-yang-ramah-dengan-hoodie-biru.jpg?s=612x612&w=0&k=20&c=OeGT_qvuHFVlN-lLKcWMzpvrw_hl1Dki5UpAwF53I3w=";

    final urlimagewish2 =
        "https://media.istockphoto.com/id/1346758988/id/foto/potret-jenggot-rapper-afrika-amerika-di-studio.jpg?s=612x612&w=0&k=20&c=Z4h2y6zexv0vyreHPYhIimShKv5ChVQqbgdCnQQ2CXE=";
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
            color: Color(0xFFFFA45B),
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
                Text("Kalung silver"),
                Text("Rp 50.000,00"),
              ],
            ),
          ),
          Container(
            color: Color(0xFFFFA45B),
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
                      child: Image.network(urlimagewish),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text("Hoodie biru"),
                Text("Rp 250.000,00"),
              ],
            ),
          ),
          Container(
            color: Color(0xFFFFA45B),
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
                      child: Image.network(urlimagewish2),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text("Hoodie hitam"),
                Text("Rp 350.000,00"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
