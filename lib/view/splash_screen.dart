import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:final_project_kel_4/view/login_screen.dart';
import 'package:final_project_kel_4/view_models/user_view_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/product_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<UserViewModel>(context, listen: false).saveUserDetail();
      Provider.of<ProductViewModel>(context, listen: false).fetchProducts();
    });
  }

  var colorizeColors = [
    Color.fromARGB(255, 223, 105, 14),
    Colors.white,
    Color.fromARGB(255, 255, 98, 0),
    Colors.amber.shade900,
  ];

  @override
  Widget build(BuildContext context) {
    Widget logo = const CircleAvatar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      radius: 100,
      child: CircleAvatar(
        radius: 95,
        backgroundImage: AssetImage('images/logo.jpg'),
      ),
    );

    Widget judul = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Welcome to  ',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Serif',
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        Center(
          child: AnimatedTextKit(
            pause: const Duration(milliseconds: 5000),
            repeatForever: true,
            animatedTexts: [
              ColorizeAnimatedText("E-PAHLAWAN",
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    fontFamily: 'Serif',
                  ),
                  colors: colorizeColors)
            ],
          ),
        ),
      ],
    );

    Widget desc = DefaultTextStyle(
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12.5,
        fontFamily: 'Serif',
        color: Colors.black54,
      ),
      child: AnimatedTextKit(
        pause: const Duration(milliseconds: 5000),
        repeatForever: true,
        animatedTexts: [
          TypewriterAnimatedText('Makanan khas surabaya brand lapis pahlawan '),
        ],
      ),
    );

    Widget buttonhome = SizedBox(
      height: 45.0,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xffFFDA77),
                  Color(0xffFFA45B),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: const Text(
              "Get Started",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "Serif",
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/blur_info.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView(shrinkWrap: true, children: <Widget>[
            logo,
            const SizedBox(
              height: 10,
            ),
            judul,
            const SizedBox(
              height: 5,
            ),
            Center(child: desc),
            const SizedBox(
              height: 50,
            ),
            Center(child: buttonhome)
          ]),
        ),
      ),
    );
  }
}
