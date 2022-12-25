import 'package:final_project_kel_4/view/bottomnav.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    Widget check = CircleAvatar(
      backgroundColor: Colors.white,
      radius: 120,
      child: CircleAvatar(
        backgroundColor: Colors.amber.shade800,
        radius: 110,
        backgroundImage: const AssetImage(
          'images/success_pay.gif',
        ),
      ),
    );

    Widget button = SizedBox(
      height: 45.0,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const BottomNav()));
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xffFFA45B), Color(0xffFFDA77)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: const Text(
              "Back to Homepage",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
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
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
              0.4,
              0.9,
            ],
                colors: [
              Color.fromARGB(255, 255, 167, 119),
              Color(0xffFFDA77)
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: check),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'CHECK OUT SUCCESS',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Serif',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text(
                'Terimakasih, selamat berbelanja di Kembali :)',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Serif',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: button,
            )
          ],
        ),
      ),
    );
  }
}
