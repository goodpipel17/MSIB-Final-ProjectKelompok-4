import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_kel_4/models/wishlist_model/wishlist_model.dart';
import 'package:final_project_kel_4/view/keranjang_screen.dart';
import 'package:final_project_kel_4/view/search_screen.dart';
import 'package:final_project_kel_4/view_models/keranjang_view_model.dart';
import 'package:final_project_kel_4/view_models/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<WishlistViewModel>(context, listen: false)
          .fetchWishlist(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          'My Wishlist !',
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
              icon: const Icon(Icons.search, color: Colors.black87),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
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
              color: Colors.black87,
            ),
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
            colors: [Colors.white, Colors.grey.shade300],
          ),
        ),
        child: ListView(children: [
          Column(
            children: <Widget>[_listOfWishlist()],
          ),
          const SizedBox(height: 15)
        ]),
      ),
    );
  }

  Widget _listOfWishlist() {
    return Consumer<WishlistViewModel>(
      builder: (context, productlist, _) => Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: productlist.listwishlist.length,
            itemBuilder: (context, index) {
              final data = productlist.listwishlist[index];
              return itemCard(data, context);
            },
          ),
        ],
      ),
    );
  }

  Widget itemCard(WishListModel wishlist, BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 1),
        child: Container(
          padding: const EdgeInsets.only(left: 15.0, right: 10.0),
          width: MediaQuery.of(context).size.width - 20.0,
          height: 150.0,
          decoration: BoxDecoration(
              color: Colors.white54, borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 5.0),
              SizedBox(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: wishlist.product.image,
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
              const SizedBox(width: 15.0),
              Consumer<KeranjangViewModel>(
                builder: (context, keranjang, _) => Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      wishlist.product.nama,
                      style: const TextStyle(
                          fontFamily: 'serif',
                          fontWeight: FontWeight.bold,
                          fontSize: 11.0,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'Stock ' + wishlist.product.jumlah.toString(),
                      style: const TextStyle(
                          fontFamily: 'serif',
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      '\$' + wishlist.product.harga.toString(),
                      style: const TextStyle(
                          fontFamily: 'serif',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green.shade200,
                      child: IconButton(
                          onPressed: () async {
                            try {
                              await keranjang.postKeranjang({
                                "product_id": "${wishlist.product.id}",
                                "qty": 1.toString()
                              }).then((value) => Fluttertoast.showToast(
                                  msg: 'added to keranjang'));
                            } catch (e) {
                              Fluttertoast.showToast(msg: e.toString());
                            }
                          },
                          icon: const Icon(
                            Icons.shopping_cart_checkout,
                            size: 20,
                            color: Colors.green,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
