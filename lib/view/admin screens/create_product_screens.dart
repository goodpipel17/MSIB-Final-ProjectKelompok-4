import 'dart:io';

import 'package:final_project_kel_4/view/login_screen.dart';
import 'package:final_project_kel_4/models/register_model/register_model.dart';
import 'package:final_project_kel_4/view/success_screen.dart';
import 'package:final_project_kel_4/view_models/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Createproduct extends StatefulWidget {
  const Createproduct({super.key});

  @override
  State<Createproduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<Createproduct> {
  File? image;

  final TextEditingController name = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _categoryidController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
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
                  controller: name,
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
                    hintText: 'Name Of product',
                    hintStyle: const TextStyle(
                      fontFamily: "Serif",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _categoryidController,
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
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _stockController,
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
                    hintText: 'Stock',
                    hintStyle: const TextStyle(
                      fontFamily: "Serif",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _hargaController,
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
                    hintText: 'Price',
                    hintStyle: const TextStyle(
                      fontFamily: "Serif",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _deskripsiController,
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
                    hintText: 'Deskripsi',
                    hintStyle: const TextStyle(
                      fontFamily: "Serif",
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
                                  email: name.text,
                                  handphone: _hargaController.text,
                                  name: _categoryidController.text,
                                  password: _stockController.text,
                                  rePassword: _deskripsiController.text))
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
                            "SUBMIT",
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

Future<File?> pickImage(BuildContext? context, {bool camera = false}) async {
  try {
    final XFile? file = await ImagePicker().pickImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
    );
    return File(file!.path);
  } catch (e) {
    showDialog(
      context: context!,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(
            e.toString(),
          ),
        );
      },
    );
  }
  return null;
}
