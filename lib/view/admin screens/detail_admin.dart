import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_kel_4/models/keranjang_model/keranjang_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:final_project_kel_4/view_models/wishlist_view_model.dart';
import 'package:final_project_kel_4/view_models/keranjang_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/product_model/productmodel.dart';

class Detailadmin extends StatelessWidget {
  final ProductModel product;
  const Detailadmin({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(
              fontFamily: "Serif",
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: Consumer<WishlistViewModel>(
        builder: (context, wishlist, _) => Consumer<KeranjangViewModel>(
          builder: (context, keranjang, _) => Container(
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
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                // offset: const Offset(1, 1),
                                // spreadRadius: 0.25,
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            // child: const Image(
                            //   image: AssetImage('images/ck.png'),
                            //   fit: BoxFit.fill,
                            // ),
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
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'serif',
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                color: Colors.redAccent.shade700,
                                onPressed: () async {
                                  try {
                                    await wishlist.postWishlist({
                                      "product_id": "${product.id}"
                                    }).then((value) => Fluttertoast.showToast(
                                        msg: 'added to Wishlist'));
                                  } catch (e) {
                                    Fluttertoast.showToast(msg: e.toString());
                                  }
                                },
                                icon: const Icon(Icons.delete_forever_rounded),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Brownies',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'serif',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            product.description,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'serif',
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rp ${product.price}",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'serif',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              try {
                                await keranjang.postKeranjang({
                                  "product_id": "${product.id}",
                                  "qty": 1.toString()
                                }).then((value) => Fluttertoast.showToast(
                                    msg: 'added to keranjang'));
                              } catch (e) {
                                Fluttertoast.showToast(msg: e.toString());
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.green, Colors.greenAccent],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 135.0,
                                  minHeight: 50.0,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Update Products",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Serif",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: Consumer<WishlistViewModel>(
      //     builder: (context, wishlist, _) => Consumer<KeranjangViewModel>(
      //       builder: (context, keranjang, _) => SpeedDial(
      //         animatedIcon: AnimatedIcons.menu_close,
      //         backgroundColor: Colors.blue.shade400,
      //         overlayColor: const Color.fromARGB(255, 133, 180, 255),
      //         overlayOpacity: 0.4,
      //         spacing: 10,
      //         children: [
      //           SpeedDialChild(
      //               child: const Icon(
      //                 Icons.star_rounded,
      //                 color: Colors.yellow,
      //                 size: 30,
      //               ),
      //               backgroundColor: Colors.yellow.shade50,
      //               label: 'add to wishlist',
      // onTap: () async {
      //   try {
      //     await wishlist
      //         .postWishlist({"product_id": "${product.id}"}).then(
      //             (value) => Fluttertoast.showToast(
      //                 msg: 'added to Wishlist'));
      //   } catch (e) {
      //     Fluttertoast.showToast(msg: e.toString());
      //   }
      // }),
      //           SpeedDialChild(
      //               child: const Icon(
      //                 Icons.shopping_cart,
      //                 color: Colors.green,
      //                 size: 25,
      //               ),
      //               backgroundColor: Colors.green.shade50,
      //               label: 'add to Keranjang',
      //               onTap: () async {
      //                 try {
      //                   await keranjang.postKeranjang({
      //                     "product_id": "${product.id}",
      //                     "qty": 1.toString()
      //                   }).then((value) =>
      //                       Fluttertoast.showToast(msg: 'added to keranjang'));
      //                 } catch (e) {
      //                   Fluttertoast.showToast(msg: e.toString());
      //                 }
      //               }),
      //         ],
      //       ),
      //     ),
      //   ),
    );
  }
}
