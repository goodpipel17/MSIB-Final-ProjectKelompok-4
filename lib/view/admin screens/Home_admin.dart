import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_kel_4/view/Brownis_Screens.dart';
import 'package:final_project_kel_4/view/Cake_screens.dart';
import 'package:final_project_kel_4/view/admin%20screens/detail_admin.dart';
import 'package:final_project_kel_4/view/detail_screen.dart';
import 'package:final_project_kel_4/view/keranjang_screen.dart';
import 'package:final_project_kel_4/view/lapis_screen.dart';

import 'package:final_project_kel_4/view/product_screen.dart';
import 'package:final_project_kel_4/view/search_screen.dart';
import 'package:final_project_kel_4/view/Cake_screens.dart';
import 'package:final_project_kel_4/view/sweater_screen.dart';
import 'package:final_project_kel_4/view/user_profile.dart';
import 'package:final_project_kel_4/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model/productmodel.dart';
import '../../view_models/product_view_model.dart';

class homeadmin extends StatefulWidget {
  const homeadmin({super.key});

  @override
  State<homeadmin> createState() => _MenuPageState();
}

class _MenuPageState extends State<homeadmin> {
  String query = '';
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;
  Timer? debouncer;
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<ProductViewModel>(context, listen: false)
          .fetchProductByCategoryName("kue4"),
    );
    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    // final products = await ProductApi().searchProduct(query);
    // ignore: await_only_futures
    final products = await ProductViewModel().listProductByCategory;

    // ignore: unnecessary_this
    setState(() => this._products = products);
  }

  Future reloadpage(String query) async => debounce(() async {
        Provider.of<ProductViewModel>(context, listen: false)
            .searchProductByName(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
        });
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          'Hello, Admin !',
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
        ],
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
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'All Products',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

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
      builder: (context, product, _) => query == ''
          ? Column(
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
            )
          : Column(
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
          builder: (context) => Detailadmin(product: product)));
    },
    child: Card(
      elevation: 1,
      shadowColor: Colors.black45,
      color: Colors.grey.shade100,
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
