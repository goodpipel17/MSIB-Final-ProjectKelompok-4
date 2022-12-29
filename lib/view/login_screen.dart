import 'package:final_project_kel_4/view/admin%20screens/bottombar_admin.dart';
import 'package:final_project_kel_4/view/bottomnav.dart';
import 'package:final_project_kel_4/view/signup_screen.dart';
import 'package:final_project_kel_4/models/login_model/login_model.dart';
import 'package:final_project_kel_4/view/user_profile.dart';
import 'package:final_project_kel_4/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    <String, WidgetBuilder>{
      '/signup': (BuildContext context) => const SignUpPage()
    };
    Widget logo = const CircleAvatar(
      backgroundColor: Colors.white,
      radius: 100,
      child: CircleAvatar(
        radius: 95,
        backgroundImage: AssetImage('images/logo.jpg'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // shadowColor: Color.fromARGB(255, 247, 229, 215),
        centerTitle: true,
        title: const Text(
          'E-PAHLAWAN',
          style: TextStyle(
            color: Colors.black87,
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
        child: ListView(
          padding: const EdgeInsets.only(top: 50.0),
          children: <Widget>[
            Center(child: logo),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, left: 45, right: 30),
              child: const Text(
                "SIGN IN",
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
            Container(
              padding: const EdgeInsets.only(top: 8, left: 45, right: 30),
              child: const Text("Login to your account",
                  style: TextStyle(
                      color: Color(0xff252525),
                      fontFamily: "Serif",
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, left: 40, right: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: const BorderSide(
                                color: Color(0xffFFA45B), width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: const BorderSide(
                                color: Color(0xffFFA45B), width: 1.0),
                          ),
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                            fontFamily: "Serif",
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black87,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                              color: Color(0xffFFA45B), width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                              color: Color(0xffFFA45B), width: 1.0),
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          fontFamily: "Serif",
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                if (_obscure) {
                                  _obscure = false;
                                } else {
                                  _obscure = true;
                                }
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.remove_red_eye,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 36,
                    ),
                    //ini button login
                    SizedBox(
                      height: 45.0,
                      child: Consumer<LoginViewModel>(
                        builder: (context, login, _) => MaterialButton(
                          onPressed: () async {
                            try {
                              await login
                                  .postLogin(
                                    LoginModel(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  )
                                  .then(
                                    (value) => Fluttertoast.showToast(
                                            msg: 'berhasil login')
                                        .then((value) {
                                      if (_emailController.text ==
                                          "admin@admin.com") {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const BottomBarAdmin()));
                                      } else {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const BottomNav()));
                                      }
                                    }
                                            // =>
                                            //     Navigator.of(context).pushReplacement(
                                            //   MaterialPageRoute(
                                            //       builder: (context)

                                            //       =>
                                            //           const BottomNav()
                                            //           ),
                                            // ),
                                            ),
                                  );
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
                                  colors: [
                                    Color(0xffFFA45B),
                                    Color(0xffFFDA77)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: const BoxConstraints(
                                  maxWidth: 400.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: const Text(
                                "LOGIN",
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
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Belum Punya Akun? ',
                          style: TextStyle(
                            fontFamily: "Serif",
                          ),
                        ),
                        const SizedBox(width: 1.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                          child: const Center(
                            child: Text('Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Serif",
                                  color: Color.fromARGB(455, 68, 85, 195),
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            //ini batas container
          ],
        ),
      ),
    );
  }
}
