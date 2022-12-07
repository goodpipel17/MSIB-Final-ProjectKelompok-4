import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:register_login/screens/bottom_bar.dart/bottom_bar.dart';

import '../../models/user_model.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text_field.dart';
import '../home/home_screen.dart';
import '../register/register_screen.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  var _user = User();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoginStatusState) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => bottom_bar()));
              });
              log(state.data.toString());
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Login To Your Account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    MyTextField(
                      'email',
                      hint: 'Email',
                      preffixIcon: Icon(Icons.email),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    BlocSelector<LoginBloc, LoginState, bool>(
                      selector: (state) => state.isHidePassword,
                      builder: (context, state) {
                        return MyTextField(
                          'password',
                          isObscureText: state,
                          hint: 'Password',
                          preffixIcon: Icon(Icons.key),
                          suffixIcon: IconButton(
                            onPressed: () => context
                                .read<LoginBloc>()
                                .add(ShowPasswordEvent(!state)),
                            icon: Icon(state
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Click Here'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: MyButton(
                        'Sign In',
                        onClick: () => _onLoginClick(context),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t Have An Account?',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          child: Text('Sign Up'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _onLoginClick(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final email = _formKey.currentState?.value['email'];
      final password = _formKey.currentState?.value['password'];
      _user = User(
        email: email,
        password: password,
      );
    }
    context.read<LoginBloc>().add(LoginUserEvent(_user));
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
