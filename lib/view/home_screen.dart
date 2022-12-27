import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_kel_4/view/Brownis_Screens.dart';
import 'package:final_project_kel_4/view/Cake_screens.dart';
import 'package:final_project_kel_4/view/keranjang_screen.dart';
import 'package:final_project_kel_4/view/lapis_screen.dart';

import 'package:final_project_kel_4/view/product_screen.dart';
import 'package:final_project_kel_4/view/search_screen.dart';
import 'package:final_project_kel_4/view/sweater_screen.dart';
import 'package:final_project_kel_4/view/user_profile.dart';
import 'package:final_project_kel_4/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model/productmodel.dart';
import '../view_models/product_view_model.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<ProductViewModel>(context, listen: false)
          .fetchProductByCategoryName("k2"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          'Hello, Username !',
          style: TextStyle(
            fontFamily: "Serif",
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //     stops: const [
        //       0.4,
        //       0.9,
        //     ],
        //     colors: [
        //       const Color.fromARGB(255, 133, 180, 255),
        //       Colors.grey.shade300
        //     ],
        //   ),
        // ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BrownisScreen(categoryName: ""),
                              ),
                            );
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
                              alignment: Alignment.center,
                              constraints: const BoxConstraints(
                                maxWidth: 80.0,
                                minHeight: 30.0,
                              ),
                              child: const Text(
                                "Brownis",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Serif",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CakeScreen(categoryName: ""),
                              ),
                            );
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
                              alignment: Alignment.center,
                              constraints: const BoxConstraints(
                                maxWidth: 65.0,
                                minHeight: 30.0,
                              ),
                              child: const Text(
                                "Cake",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Serif",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LapisScreen(categoryName: ""),
                              ),
                            );
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
                              alignment: Alignment.center,
                              constraints: const BoxConstraints(
                                maxWidth: 65.0,
                                minHeight: 30.0,
                              ),
                              child: const Text(
                                "Lapis",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Serif",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ===== MENU =====
                  const SizedBox(
                    height: 8,
                  ),
                  // _listOfProducts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listOfProducts() {
    return Consumer<ProductViewModel>(
      builder: (context, product, _) => Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: product.listProductByCategory.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final data = product.listProductByCategory[index];
              return _cardProduct(data, context);
            },
          ),
        ],
      ),
    );
  }
}

Widget _cardProduct(ProductModel product, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetail(product: product)));
    },
    child: Card(
      color: const Color.fromARGB(129, 255, 255, 255),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 110,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(
                imageUrl: product.img,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                product.name.toString(),
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Color.fromARGB(255, 62, 65, 102),
                ),
              ),
              Text(
                "Rp ${product.price}",
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Color.fromARGB(255, 62, 65, 102),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
