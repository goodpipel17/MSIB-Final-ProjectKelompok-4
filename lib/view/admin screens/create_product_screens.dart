import 'package:final_project_kel_4/view/login_screen.dart';
import 'package:final_project_kel_4/models/register_model/register_model.dart';
import 'package:final_project_kel_4/view/success_screen.dart';
import 'package:final_project_kel_4/view_models/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Createproduct extends StatefulWidget {
  const Createproduct({super.key});

  @override
  State<Createproduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<Createproduct> {
  final TextEditingController username = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _handphoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    Widget logo = const CircleAvatar(
      backgroundColor: Color.fromARGB(455, 455, 455, 455),
      radius: 100,
      child: CircleAvatar(
        radius: 95,
        backgroundImage: AssetImage('images/logo.jpg'),
      ),
    );

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 50.0),
        children: <Widget>[
          Center(child: logo),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: const Text(
              "Create a new products",
              style: TextStyle(
                  color: Color(0xff252525),
                  fontFamily: "Serif",
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(
                            color: Color(0xffFFA45B), width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(
                            color: Color(0xffFFA45B), width: 1.0)),
                    hintText: 'Name',
                    hintStyle: const TextStyle(
                      fontFamily: "Serif",
                    ),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(
                            color: Color(0xffFFA45B), width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(
                            color: Color(0xffFFA45B), width: 1.0)),
                    hintText: 'Category ID',
                    hintStyle: const TextStyle(
                      fontFamily: "Serif",
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _handphoneController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(
                            color: Color(0xffFFA45B), width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(
                            color: Color(0xffFFA45B), width: 1.0)),
                    hintText: 'Handphone',
                    hintStyle: const TextStyle(
                      fontFamily: "Serif",
                    ),
                    prefixIcon: const Icon(
                      Icons.phone_android,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 45.0,
                  child: Consumer<RegisterViewModel>(
                    builder: (context, register, _) => MaterialButton(
                      onPressed: () async {
                        try {
                          await register
                              .postRegister(RegisterModel(
                                  email: _emailController.text,
                                  handphone: _handphoneController.text,
                                  name: username.text,
                                  password: _passwordController.text,
                                  rePassword: _passwordConfirmController.text))
                              .then((value) => Fluttertoast.showToast(
                                  msg: 'berhasil register'));
                        } catch (e) {
                          Fluttertoast.showToast(msg: e.toString());
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
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
                          constraints: const BoxConstraints(
                              maxWidth: 400.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Text(
                            "SIGN UP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Serif",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
