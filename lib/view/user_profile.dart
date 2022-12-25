import 'package:final_project_kel_4/view/bottomnav.dart';
import 'package:final_project_kel_4/view/info_screen.dart';
import 'package:final_project_kel_4/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    // Widget button = SizedBox(
    //   height: 45.0,
    //   child: MaterialButton(
    //     onPressed: () {
    //       Navigator.push(context,
    //           MaterialPageRoute(builder: (context) => const BottomNav()));
    //     },
    //     shape:
    //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
    //     padding: const EdgeInsets.all(0.0),
    //     child: Ink(
    //       decoration: BoxDecoration(
    //           gradient: const LinearGradient(
    //             colors: [Color(0xffFFA45B), Color(0xffFFDA77)],
    //             begin: Alignment.centerLeft,
    //             end: Alignment.centerRight,
    //           ),
    //           borderRadius: BorderRadius.circular(30.0)),
    //       child: Container(
    //         constraints: const BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
    //         alignment: Alignment.center,
    //         child: const Text(
    //           "Back to Homepage",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //               color: Colors.white,
    //               fontFamily: "Serif",
    //               fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: const Color.fromARGB(255, 71, 147, 248),
      //   shadowColor: const Color.fromARGB(255, 0, 11, 106),
      //   centerTitle: true,
      //   title: const Text(
      //     'User Profile',
      //     style: TextStyle(
      //         fontFamily: "Serif",
      //         fontWeight: FontWeight.bold,
      //         shadows: [
      //           Shadow(
      //             color: Colors.black,
      //             blurRadius: 10.0,
      //             offset: Offset(1.0, 3.0),
      //           ),
      //           Shadow(
      //             color: Color.fromARGB(255, 71, 147, 248),
      //             blurRadius: 10.0,
      //             offset: Offset(-5.0, 5.0),
      //           ),
      //         ]),
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: const [
              0.4,
              0.9,
            ],
            colors: [Colors.white, Colors.grey.shade300],
          ),
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              SafeArea(
                  child: Consumer<UserViewModel>(
                builder: (context, login, _) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 100.0,
                      backgroundImage: AssetImage('images/icon_profile.jpg'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Farhan",
                      // login.user.name,
                      style: const TextStyle(
                          fontFamily: 'serif',
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                    const Text(
                      "User",
                      style: TextStyle(
                          fontFamily: 'serif',
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          letterSpacing: 2.5),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // ignore: prefer_const_constructors
                    Card(
                      shape: const StadiumBorder(
                        side: BorderSide(
                          color: Color(0xffFFA45B),
                          width: 2.0,
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 25.0),
                      child: const ListTile(
                        leading: Icon(
                          FontAwesomeIcons.solidIdCard,
                          color: Colors.black87,
                        ),
                        // title: Text(login.user.id.toString()),
                        title: Text("98563"),
                      ),
                    ),
                    const Card(
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Color(0xffFFA45B),
                          width: 2.0,
                        ),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.email_rounded,
                          color: Colors.black87,
                        ),
                        // title: Text(login.user.email),
                        title: Text("Farhan@test.com"),
                      ),
                    ),
                    const Card(
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Color(0xffFFA45B),
                          width: 2.0,
                        ),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                      child: ListTile(
                        // ignore: unnecessary_const
                        leading: const Icon(
                          FontAwesomeIcons.squarePhone,
                          color: Colors.black87,
                        ),
                        // title: Text(login.user.handphone),
                        title: Text("082134523453"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // button
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Color(0xffFFA45B),
        overlayColor: Color.fromARGB(255, 241, 215, 195),
        overlayOpacity: 0.4,
        spacing: 10,
        children: [
          SpeedDialChild(
              child: const Icon(
                Icons.info_outline_rounded,
                color: Color(0xffFFA45B),
                size: 25,
              ),
              backgroundColor: Colors.green.shade50,
              label: 'About US',
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Info()),
                );
              }),
        ],
      ),
    );
  }
}
