import 'package:flutter/material.dart';
import 'package:register_login/screens/profile/page1.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final urlimage =
        'https://images.unsplash.com/photo-1503235930437-8c6293ba41f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80';

    final length = 5;
    return Scaffold(
      appBar: AppBar(
          // leading: Container(),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFBF6F0),
          elevation: 0.0,
          title: const Text('PROFILE')),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(urlimage),
            radius: 80,
          ),
          Padding(padding: EdgeInsets.all(5)),
          Center(
            child: Text(
              'Reynaldy Kurniawan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(padding: EdgeInsets.all(15)),
          ListTile(
            tileColor: Colors.blueGrey.shade100,
            leading: Icon(Icons.person, color: Colors.blue.shade900),
            title: Text("Edit Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => page1()));
            },
          ),
          Padding(padding: EdgeInsets.all(6)),
          ListTile(
            tileColor: Colors.blueGrey.shade100,
            leading: Icon(Icons.location_on, color: Colors.amber.shade900),
            title: Text("My Address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return page1();
              }));
            },
          ),
          Padding(padding: EdgeInsets.all(6)),
          ListTile(
            tileColor: Colors.blueGrey.shade100,
            leading: Icon(Icons.menu_rounded, color: Colors.green),
            title: Text("History",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return page1();
              }));
            },
          ),
          Padding(padding: EdgeInsets.all(6)),
          ListTile(
            tileColor: Colors.blueGrey.shade100,
            leading: Icon(Icons.settings, color: Colors.black87),
            title: Text("Setting",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => page1()));
            },
          ),
          Padding(padding: EdgeInsets.all(6)),
          ListTile(
            tileColor: Colors.blueGrey.shade100,
            leading: Icon(Icons.logout, color: Colors.deepPurple),
            title: Text("Sign out",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return page1();
              }));
            },
          ),
        ],
      ),
    );
  }
}
