import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_kel_4/view/detail_screen.dart';
import 'package:final_project_kel_4/view/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model/productmodel.dart';
import '../view_models/product_view_model.dart';

class LapisScreen extends StatefulWidget {
  final String categoryName;
  const LapisScreen({super.key, required this.categoryName});

  @override
  State<LapisScreen> createState() => _LapisScreenState();
}

class _LapisScreenState extends State<LapisScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<ProductViewModel>(context, listen: false)
          .fetchProductByCategoryName(widget.categoryName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Category Lapis',
          style: TextStyle(
              fontFamily: "Serif",
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black87,
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
            colors: [Colors.white, Colors.grey.shade50],
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // ===== MENU =====
                  const SizedBox(
                    height: 8,
                  ),
                  _listOfProducts(),
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
          builder: (context) => DetailScreen(product: product)));
    },
    child: Card(
      color: const Color.fromARGB(129, 255, 255, 255),
      elevation: 1,
      shadowColor: Colors.black45,
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
                product.price.toString(),
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
