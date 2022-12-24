import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatelessWidget {
  const Info({super.key});
  @override
  Widget build(BuildContext context) {
    Widget content1 = const CircleAvatar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      radius: 100,
      child: CircleAvatar(
        radius: 95,
        backgroundImage: AssetImage('images/logo.jpg'),
      ),
    );

    Widget content2 = Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.all(50.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 7,
            offset: Offset(2, 4), // Shadow position
          ),
        ],
      ),
      child: Column(
        children: const [
          Center(
            child: Text(
              '"E-Pahlawan"',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Serif',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 218, 119, 37),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'E-Pahlawan adalah marketplace yang menyediakan Lapis dan brownis khas surabaya kesukaan anda. Apalagi yang anda tunggu pesan sekarang di E-pahlawan mudah dan praktis.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 13.0,
                fontFamily: 'Serif',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 218, 119, 37),
              ),
            ),
          ),
        ],
      ),
    );

    Widget content3 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GFButton(
          boxShadow: const BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(4, 3), // Shadow position
          ),
          onPressed: () {
            launchUrl(Uri.parse('https://www.facebook.com/ShopatGOSHOP/'));
          },
          text: "Facebook",
          textColor: Colors.black,
          icon: const Icon(Icons.facebook),
          shape: GFButtonShape.pills,
          color: Colors.blue.shade400,
        ),
        const SizedBox(
          width: 10,
        ),
        GFButton(
          boxShadow: const BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(4, 3), // Shadow position
          ),
          color: Colors.blue.shade200,
          onPressed: () {
            launchUrl(Uri.parse('https://twitter.com/shopatgoshop'));
          },
          text: "Twitter",
          textColor: Colors.black,
          icon: const Icon(FontAwesomeIcons.twitter),
          shape: GFButtonShape.pills,
        ),
        const SizedBox(
          width: 10,
        ),
        GFButton(
          boxShadow: const BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(4, 3), // Shadow position
          ),
          onPressed: () {
            launchUrl(
                Uri.parse('https://www.instagram.com/shopatgoshop/?hl=en'));
          },
          text: "Instagram",
          textColor: Colors.black,
          icon: const Icon(
            FontAwesomeIcons.instagram,
          ),
          shape: GFButtonShape.pills,
          color: Colors.red.shade200,
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'ABOUT US',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Serif",
            fontWeight: FontWeight.bold,
            // shadows: [
            //   Shadow(
            //     color: Colors.black45,
            //     blurRadius: 10.0,
            //     offset: Offset(1.0, 3.0),
            //   ),
            //   Shadow(
            //     color: Colors.black38,
            //     blurRadius: 10.0,
            //     offset: Offset(-5.0, 5.0),
            //   ),
            // ]
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/BG_about.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView(shrinkWrap: true, children: <Widget>[
            content1,
            const SizedBox(
              height: 5,
            ),
            content2,
            const SizedBox(
              height: 20,
            ),
            content3
          ]),
        ),
      ),
    );
  }
}
