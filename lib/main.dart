import 'package:final_project_kel_4/view/bottomnav.dart';
import 'package:final_project_kel_4/view/home_screen.dart';
import 'package:final_project_kel_4/view/info_screen.dart';
import 'package:final_project_kel_4/view/splash_screen.dart';
import 'package:final_project_kel_4/view/user_profile.dart';

import 'package:final_project_kel_4/view_models/keranjang_view_model.dart';
import 'package:final_project_kel_4/view_models/login_view_model.dart';
import 'package:final_project_kel_4/view_models/product_view_model.dart';
import 'package:final_project_kel_4/view_models/register_view_model.dart';
import 'package:final_project_kel_4/view_models/transaction_view_model.dart';
import 'package:final_project_kel_4/view_models/user_view_model.dart';
import 'package:final_project_kel_4/view_models/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RegisterViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => KeranjangViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BottomNav(),
      ),
    );
  }
}
