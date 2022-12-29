import 'dart:async';

import 'package:final_project_kel_4/view/detail_screen.dart';
import 'package:final_project_kel_4/view/product_screen.dart';
import 'package:final_project_kel_4/view/search_widget.dart';
import 'package:final_project_kel_4/models/product_model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model/api/product_api.dart';
import '../view_models/product_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<ProductViewModel>(context, listen: false)
          .fetchProductByCategoryName("kue4"),
    );
    Future.microtask(
      () => Provider.of<ProductViewModel>(context, listen: false)
          .searchProductByName("kue4"),
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

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black87,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Search Product',
            style: TextStyle(
              fontFamily: "Serif",
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          elevation: 2,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.4,
                0.9,
              ],
              colors: [Colors.white, Colors.grey],
            ),
          ),
          child: Column(
            children: <Widget>[
              buildSearch(),
              _listOfSearch(),
            ],
          ),
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Name or Category Product',
        onChanged: searchBook,
      );

  Widget _listOfSearch() {
    return Consumer<ProductViewModel>(
      builder: (context, search, _) => query == ''
          ? Expanded(
              child: ListView.builder(
                itemCount: search.listProductByCategory.length,
                itemBuilder: (context, index) {
                  final data = search.listProductByCategory[index];
                  return buildProduct(data, context);
                },
              ),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: search.listProductSearch.length,
                itemBuilder: (context, index) {
                  final data = search.listProductSearch[index];
                  return buildProduct(data, context);
                },
              ),
            ),
    );
  }

  Future searchBook(String query) async => debounce(() async {
        Provider.of<ProductViewModel>(context, listen: false)
            .searchProductByName(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
        });
      });

  Widget buildProduct(ProductModel product, BuildContext context) =>
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(product: product)));
        },
        child: Material(
          elevation: 3,
          shadowColor: Colors.black,
          child: ListTile(
            leading: Image.network(
              product.img,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            title: Text(product.name),
            subtitle: Text(product.category.name),
          ),
        ),
      );
}
