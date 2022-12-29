import 'package:final_project_kel_4/models/admin_model/create_product/api/create_product.dart';
import 'package:final_project_kel_4/models/admin_model/create_product/create_model.dart';
import 'package:final_project_kel_4/view/admin%20screens/create_product_screens.dart';

import 'package:flutter/material.dart';

class createproductViewModel with ChangeNotifier {
  final CreatProductApi _createapi = CreatProductApi();

  Future<void> postprodcts(CreateOfProductModel Createproduct) async {
    try {
      await _createapi.postprodcts(Createproduct);
    } catch (_) {
      rethrow;
    }
  }
}
